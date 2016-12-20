% bateman_diff_eq - Solve the Bateman equations using an ODE solver
% decay rates are global so they can be seen inside the function
%
% needs dcdt.m
%
% csherwood@usgs.gov
% 19 Dec 2016

global lam
lam = [.0052, .01, .0161, .05];

% intial concentration for four constituents
C0 = [.68, .23, .06, 0.];
% time array
tspan = [1980 2015];
% call ODE solver
[t, C] = ode45(@dcdt,tspan,C0);

figure(1); clf;
plot(t,C(:,1))
hold on
plot(t,C(:,2))
plot(t,C(:,3))
plot(t,C(:,4))
xlabel('Time (years)')
ylabel('Concentration (\mumol / kg)')
legend('DDE','DDMU','DDNU','?')