% bateman_molar - Script to calculate dechlorination sequence for molar
%    concentrations of DDE -> DDNU -> DDMU -> ?
%
% csherwood@usgs.gov
% 19 Dec 2016
%
% Needs:
%   bateman
%   define_colors
global lam
% standardize colors
define_colors
% time step
dt = 1;
% num. of time steps
n = 100;
% declare arrays
N1 = nan(n,1);
N2 = nan(n,1);
N3 = nan(n,1);

% pick a site
site3C=1;
site6C=0;

if(site3C)
    % hard code the data Eganhouse sent on 16-Dec-2016
    tmeas = [1981.27;1992.51;2003.58;2009.23;2010.31];
    % data array [time, chemical]
    invmeas = [ 166.3, 9.68, 1.44;...
        108.1 44.90 6.78;...
        79.3 82.15 28.89;...
        50.3 91.14 22.66;...
        54.4 85.45 25.93 ];
    ts = 'Site 3C';
    % This does not work when any of the lams are the same!
    % Guess at decay coefficients (these are eyeball fits):
    lam = [.04 .02 0.03];
end

if(site6C)
    % hard code the data Eganhouse sent on 16-Dec-2016
    tmeas = [1992.52;2003.58;2009.23;2010.31];
    invmeas = [ 169.3, 31.27, 3.17;...
        155.1, 38.05, 6.83;...
        138.0 27.81, 8.55;...
        145.9 41.15 14.49];
    ts = 'Site 6C';
    % This does not work when any of the lams are the same!
    % Guess at decay coefficients (these are eyeball fits):
    lam = [.01 .04 0.09]; 
end

% initialize
tstart = tmeas(1);
N1(1) = invmeas(1,1);
N2(1) = invmeas(1,2);
N3(1) = invmeas(1,3);

% calculate dechlorination for each time step
for i = 1:n-1
    [N1i,N2i,N3i] = bateman(N1(i),N2(i),N3(i),lam,dt); 
    N1(i+1) = N1i;
    N2(i+1) = N2i;
    N3(i+1) = N3i;
end

%% Compute numerical solution
if(0)
% time array
tspan = [tstart 2020];
C0 = [N1(1),N2(1),N3(1)];
% call ODE solver for three constituents (no global decay)
[tode, C] = ode45(@dcdt3,tspan,C0);
end
%% plot results
fsz = 14;  % fontsize
set(0,'defaultaxesfontsize',fsz)
set(0,'defaulttextfontsize',fsz)

t = tstart:dt:tstart+dt*(n-1);

figure(1)
clf

% plot numerical solution...these overlay exactly
if(0)
hn1=plot(tode, C(:,1),'+')
hold on
hn2=plot(tode, C(:,2),'+')
hn3=plot(tode, C(:,3),'+')
end

hi1=plot(tmeas,invmeas(:,1),'o');
hold on
hi2=plot(tmeas,invmeas(:,2),'o');
hi3=plot(tmeas,invmeas(:,3),'o');
set(hi1,'markerfacecolor',DDEcol','markeredgecolor',Totcol,'markersize',10)
set(hi2,'markerfacecolor',DDMUcol','markeredgecolor',Totcol,'markersize',10)
set(hi3,'markerfacecolor',DDNUcol','markeredgecolor',Totcol,'markersize',10)

h1=plot(t,N1,'-');
h2=plot(t,N2,'-');
h3=plot(t,N3,'-');
h4=plot(t,N1+N2+N3,'-');
set(h1,'color',DDEcol,'linewidth',2)
set(h2,'color',DDMUcol,'linewidth',2)
set(h3,'color',DDNUcol,'linewidth',2)
set(h4,'color',Totcol,'linewidth',2)
l=legend([h1;h2;h3;h4],'DDE ','DDMU','DDNU','Total');
xlabel('Year')
ylabel('Molar Inventory (mmol/cm2)')
xlim([1980 2020])
title(ts)

figure(2)
clf
hi1=semilogy(tmeas,invmeas(:,1),'o');
hold on
hi2=semilogy(tmeas,invmeas(:,2),'o');
hi3=semilogy(tmeas,invmeas(:,3),'o');
set(hi1,'markerfacecolor',DDEcol','markeredgecolor',Totcol,'markersize',10)
set(hi2,'markerfacecolor',DDMUcol','markeredgecolor',Totcol,'markersize',10)
set(hi3,'markerfacecolor',DDNUcol','markeredgecolor',Totcol,'markersize',10)

h1=semilogy(t,N1,'-');
h2=semilogy(t,N2,'-');
h3=semilogy(t,N3,'-');
h4=semilogy(t,N1+N2+N3,'-');
set(h1,'color',DDEcol,'linewidth',2)
set(h2,'color',DDMUcol,'linewidth',2)
set(h3,'color',DDNUcol,'linewidth',2)
set(h4,'color',Totcol,'linewidth',2)
l=legend([h1;h2;h3;h4],'DDE ','DDMU','DDNU','Total');
xlabel('Year')
ylabel('Molar Inventory (mmol/cm2)')
xlim([1980 2020])
title(ts)
