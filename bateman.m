function [N1,N2,N3] = bateman(N1o,N2o,N3o,lam,dt)
% function [N1, N2, N3] = bateman(N1o, N2o, N3o, lam, dt ]
%
% Calculates decay sequence for two daughter products
%
% Input:
%   N1o, N2o, N3o = Initial inventories of three reactants
%   lam = three-element vector with decay/tranfer coefficients
%   dt = time step
% Returns:
%   N1, N2, N3 = Final inventories after time dt
%
% by Patrick Dickhudt  23-Mar-2010
% Based on:
% Keegan, R.P. and R.J.Gehrke (2003) "A method to determin the time since
% last purification of weapons grade plutonium" Applied Radiation and
% Isotopes 59:137-143.

% modified by csherwood@usgs.gov 19-Dec-2016
% Note: These fail with divide-by-zero when any of the lam values are equivalent!

 N1 = N1o.*exp(-lam(1).*dt);
 N2 = lam(1)./(lam(2)-lam(1)).*N1o.*(exp(-lam(1).*dt)-exp(-lam(2).*dt))...
   + N2o.*exp(-lam(2).*dt);
 
% from Eganhouse report - I think this is wrong (PJW)
%  N3 = lam(1).*lam(2).*N1o ./ ((lam(2)-lam(1))+(lam(3)-lam(1))) .* exp(-lam(1).*dt)... 
%    + ( lam(1).*lam(2).*N1o ./ ((lam(1)-lam(2)).*(lam(3)-lam(1)))... % 2nd part negative    
%    + lam(2).*lam(3).*N2o ./ (lam(3)-lam(2)) ).*exp(-lam(2).*dt) ...      
%    + ( lam(1).*lam(2).*N1o ./ ((lam(1)-lam(3)).*(lam(2)-lam(3))) ...      
%    + lam(2).*lam(3).*N2o ./ (lam(2)-lam(3)) + N3o ).*exp(-lam(3).*dt);

% % from plutonium paper
N3 = N1o*((lam(1)*lam(2))/((lam(2)-lam(1))*(lam(3)-lam(1))))*(exp(-lam(1)*dt)-exp(-lam(3)*dt))...
   +N2o*(lam(2)/(lam(3)-lam(2)))*(exp(-lam(2)*dt)-exp(-lam(3)*dt))...
   -N1o*(lam(1)*lam(2))/((lam(2)-lam(1))*(lam(3)-lam(2)))*(exp(-lam(2)*dt)-exp(-lam(3)*dt))...
   +N3o*exp(-lam(3)*dt);

end
