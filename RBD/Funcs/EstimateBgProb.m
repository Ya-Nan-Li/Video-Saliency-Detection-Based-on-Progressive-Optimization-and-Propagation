function [bgProb, bdCon, bgWeight] = EstimateBgProb(colDistM, motDistM, adjcMatrix, bdIds, clipVal, geoSigma, idxImg)
% Estimate background probability using boundary connectivity

% Code Author: Wangjiang Zhu
% Email: wangjiang88119@gmail.com
% Date: 3/24/2014

bdCon = BoundaryConnectivity(adjcMatrix, colDistM, bdIds, clipVal, geoSigma, true);

bdConSigma = 1; %sigma for converting bdCon value to background probability
fgColProb = exp(-bdCon.^2 / (2 * bdConSigma * bdConSigma)); %Estimate bg probability
fgColProb = normalizeSal(fgColProb);
% 计算运动连通图
fgMotProb = MotionConnectivity(adjcMatrix, motDistM, idxImg );
bdConSigma = 0.1;
fgMotProb = exp(-fgMotProb.^2 / (2 * bdConSigma * bdConSigma)); %Estimate bg probability
fgMotProb = normalizeSal(fgMotProb);
fgProb = fgColProb+fgMotProb;
bgProb = 1 - normalizeSal(fgProb); 

bgWeight = bgProb;
% Give a very large weight for very confident bg sps can get slightly
% better saliency maps, you can turn it off.
fixHighBdConSP = true;
highThresh = 3;
if fixHighBdConSP
    bgWeight(bdCon > highThresh) = 1000;
end