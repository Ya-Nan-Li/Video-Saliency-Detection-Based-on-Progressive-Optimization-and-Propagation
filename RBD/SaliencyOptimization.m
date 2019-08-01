function optwCtr = SaliencyOptimization(adjcMatrix, bdIds, colDistM, neiSigma, bgWeight, fgWeight)
% % Solve the least-square problem in Equa(9) in our paper

adjcMatrix_nn = LinkNNAndBoundary(adjcMatrix, bdIds);
theta=10;
allDists = colDistM(adjcMatrix_nn > 0);
maxVal = max(allDists);
minVal = min(allDists);

colDistM(adjcMatrix_nn == 0) = Inf;
colDistM = (colDistM - minVal) / (maxVal - minVal + eps);
W = exp(-colDistM * theta);
D = diag(sum(W));

spNum = size(adjcMatrix,1);
% optwCtr =(D - W * 0.99) \ eye(spNum);
% optwCtr(1:spNum+1:end) = 0;  %set diagonal elements to be zero
% optwCtr = optwCtr * fgWeight;

% adjcMatrix_nn = LinkNNAndBoundary(adjcMatrix, bdIds);
% colDistM(adjcMatrix_nn == 0) = Inf;
% Wn = Dist2WeightMatrix(colDistM, neiSigma);      %smoothness term
% mu = 0.1;                                                   %small coefficients for regularization term
% W = Wn + adjcMatrix * mu;                                   %add regularization term
% D = diag(sum(W));
% 
bgLambda = 5;   %global weight for background term, bgLambda > 1 means we rely more on bg cue than fg cue.
E_bg = diag(bgWeight * bgLambda);       %background term
E_fg = diag(fgWeight);          %foreground term

spNum = length(bgWeight);
optwCtr =(D - W + E_bg + E_fg) \ (E_fg * ones(spNum, 1));
