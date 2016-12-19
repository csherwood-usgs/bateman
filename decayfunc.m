function C = decayfunc(x,a)
% C = decayfunc(x,a)
% Decay function for use in nl ls fits
% Input:
%    C0 = initial concentration
%    x  = time
%    a = decay coefficient
% Returns
%    C(x)
global C0
C = C0.*exp(a*x);
return