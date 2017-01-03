%% plot results of RDC model

fsz = 14;  % fontsize
set(0,'defaultaxesfontsize',fsz)
set(0,'defaulttextfontsize',fsz)

figure(2); clf

% plot numerical solution
if(1)
h1=plot(t, Cn(:,1),'-');
hold on
h2=plot(t, Cn(:,2),'-');
h3=plot(t, Cn(:,3),'-');
h4=plot(t, sum(Cn,2),'-');
hh=plot(tspan,C2,'xk');
ht=plot(tspan,sum(C2,2),'xk');
end

hi1=plot(tspan,Cmeas(:,1),'o');
hold on
hi2=plot(tspan,Cmeas(:,2),'o');
hi3=plot(tspan,Cmeas(:,3),'o');
hi4=plot(tspan,invtot,'o');
set(hi1,'markerfacecolor',DDEcol','markeredgecolor',Totcol,'markersize',10)
set(hi2,'markerfacecolor',DDMUcol','markeredgecolor',Totcol,'markersize',10)
set(hi3,'markerfacecolor',DDNUcol','markeredgecolor',Totcol,'markersize',10)
set(hi4,'markerfacecolor',Totcol','markeredgecolor',Totcol,'markersize',10)

set(h1,'color',DDEcol,'linewidth',2)
set(h2,'color',DDMUcol,'linewidth',2)
set(h3,'color',DDNUcol,'linewidth',2)
set(h4,'color',Totcol,'linewidth',2)
l=legend([h1;h2;h3;h4],'DDE ','DDMU','DDNU','Total');
xlabel('Year')
ylabel('Inventory ({\mu}mol/cm^2)')
if(adjust)
ylabel('Adjusted Inventory ({\mu}mol/cm^2)')
end
xlim([1980 2025])
title(ts)
ts1 = ['$${k_1} = ',sprintf('%5.3f',-lam(1)),' $$'];
ts2 = ['$${k_2} = ',sprintf('%5.3f',-lam(2)),' $$'];
ts3 = ['$${k_3} = ',sprintf('%5.3f',-lam(3)),' $$'];
chi_str = sprintf('%7.3f',X2);
ts4=['$${{\chi}^2}_{\nu} = ',chi_str,' $$'];
text(2016,0.1,ts4,'interpreter','latex')
text(2016,0.2,ts3,'interpreter','latex')
text(2016,0.3,ts2,'interpreter','latex')
text(2016,0.4,ts1,'interpreter','latex')
%% Plot residuals
if(0)
resid = C2-Cmeas
RMS = sqrt(sum(sum(resid.^2)))

figure; clf
plot([1980 2020],[0 0],'--k')
hold on
hi1=plot(tspan,resid(:,1),'o');
hi2=plot(tspan,resid(:,2),'o');
hi3=plot(tspan,resid(:,3),'o');
hi4=plot(tspan,invtot-sum(C2,2),'o');
set(hi1,'markerfacecolor',DDEcol','markeredgecolor',Totcol,'markersize',10)
set(hi2,'markerfacecolor',DDMUcol','markeredgecolor',Totcol,'markersize',10)
set(hi3,'markerfacecolor',DDNUcol','markeredgecolor',Totcol,'markersize',10)
set(hi4,'markerfacecolor',Totcol','markeredgecolor',Totcol,'markersize',10)
title(num2str(X2))
end