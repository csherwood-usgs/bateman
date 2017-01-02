function [t,C] = bateman_diff_eq_nested( tspan, C0, lam )
% bateman_diff_eq_nested - Solve the Bateman equations using an ODE solver
% [t,C]=bateman_diff_eq_nested( tspan, CO, lam )
%
% This is the best numerical version. It uses the nested function approach,
% so no global variables are needed.
%
% Input:
%   tspan - either [tstart tend] or [time_array]
%     If [tstart tend], t and C will be returned at each numertical time
%     step, as determined by the solver
%     If [time_array] (row array), then t and C will be returned at
%     specified times
%   C0 - row array of three initial concentrations, one for each
%     constituent
%   lam - row array of three decay/transfer coefficients
%
% Returns:
%   t - column array of times
%   C - matrix of concentrations [time, constituent]

% csherwood@usgs.gov
% 21 Dec 2016

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