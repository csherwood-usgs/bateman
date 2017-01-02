% test_bateman_diff_eq_nested - Solve the Bateman equations using an ODE solver
% The ODE solver and the diff eq wrapped in a functions so that decay rates
% don't have to be global
%
% needs dcdt.m
%
% csherwood@usgs.gov

lam = [.0052, .01, .0161 ];

% intial concentration for four constituents
C0 = [.68, .23, .06 ];
% time array
tspan = [1980:5:2015];
% call ODE solver
%[t, C] = ode45(@dcdt,tspan,C0);
[t,C] = bateman_diff_eq_nested( tspan, C0, lam )

figure(1); clf;
plot(t,C(:,1))
hold on
plot(t,C(:,2))
plot(t,C(:,3))

xlabel('Time (years)')
ylabel('Concentration (\mumol / kg)')
legend('DDE','DDMU','DDNU')