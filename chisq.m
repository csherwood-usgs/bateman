function [X2,PX,df] = chisq(model,data,datavar,n)
% X2 = chisq(model,data,datavar,[n])
%   "Reduced" chi square, where df = N - n, where N is number
%   of observations, and n is the number of coefficients or parameters
%   in the model. Default n = 1. Works for vectors only.
%
% Glover et al., 2011, p. 50

% csherwood@usgs.gov
if(exist('n','var')~=1),n=1;end;
N = length(model);
df = N-n;
X2 = NaN; PX = NaN;
if(df<=1),error('Not enough data in chisq.');end;
X2 = (1./df)*sum( (model - data).^2 ./datavar );
PX = gammainc(X2/2,df/2);
return