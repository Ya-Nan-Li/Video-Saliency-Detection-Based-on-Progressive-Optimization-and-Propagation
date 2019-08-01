function wCtr = CalWeightedContrast( posDistM, motDistM, bgProb,alpha)
% Calculate background probability weighted contrast

% Code Author: Wangjiang Zhu
% Email: wangjiang88119@gmail.com
% Date: 3/24/2014
% motSigma = mean(mean(motDistM));
% motDistM = exp(-motSigma .* motDistM);
spaSigma = 0.4;     %sigma for spatial weight
posWeight = Dist2WeightMatrix(posDistM, spaSigma);

%bgProb weighted contrast
% wCtr = ( colDistM + motDistM ) .* posWeight * bgProb;
% wCtr = colDistM .* posWeight * bgProb;
% motWeight = exp(- alpha * motDistM);

wCtr = motDistM .* posWeight * bgProb;
wCtr = (wCtr - min(wCtr)) / (max(wCtr) - min(wCtr) + eps);

%post-processing for cleaner fg cue
removeLowVals = true;
if removeLowVals
    thresh = graythresh(wCtr);  %automatic threshold
    wCtr(wCtr < thresh) = 0;
end