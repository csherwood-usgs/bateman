function C = decayfunc_num(tspan,lam)
% C = decayfunc_num(x,a)
% Decay function for use in nl ls fits
% This version is numerical integration

global  C0

% call ODE solver
[t, C] = ode45(@dFdt,tspan,C0);

   function dcdt = dFdt(t,c)
      dcdt = zeros(3,1);
      dcdt(1) = c(1)* -lam(1);
      dcdt(2) = c(2)* -lam(2) + c(1)*lam(1);
      dcdt(3) = c(3)* -lam(3) + c(2)*lam(2);
      return
   end

return
end