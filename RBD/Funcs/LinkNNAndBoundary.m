function adjcMatrix = LinkNNAndBoundary(adjcMatrix, bdIds)
%link 2 layers of neighbor super-pixels and boundary patches

% Code Author: Wangjiang Zhu
% Email: wangjiang88119@gmail.com
% Date: 3/24/2014
% link neighbor's neighbor
adjcMatrix = (adjcMatrix * adjcMatrix + adjcMatrix) > 0;
adjcMatrix = double(adjcMatrix);
% link boundary SPs
adjcMatrix(bdIds, bdIds) = 1;

% spNum = size(adjcMatrix, 1);
% adjcMatrix(1:spNum+1:end) = 0;  %diagnal elements set to be zero