% plot_inventories - Initial plots of DDE, DDMU, DDNU, and PCB inventories
define_colors

% run script to load data 
inventories

%% Fig 1 - Plot of inventory / initial inventory

figure(1);clf
subplot(211)
plot([1980 2015],[1,1],'--k')
hold on
plot(Site3C.date,Site3C.DDE./Site3C.DDE(1),'-','linewidth',2,'color',DDEcol);
plot(Site3C.date,Site3C.DDMU./Site3C.DDMU(1),'-','linewidth',2,'color',DDMUcol);
plot(Site3C.date,Site3C.DDNU./Site3C.DDNU(1),'-','linewidth',2,'color',DDNUcol);
plot(Site3C.date,Site3C.PCB118./Site3C.PCB118(1),'--','linewidth',2,'color',PCB118col);
plot(Site3C.date,Site3C.PCB153./Site3C.PCB153(1),'--','linewidth',2,'color',PCB153col);
plot(Site3C.date,Site3C.PCB138./Site3C.PCB138(1),'--','linewidth',2,'color',PCB138col);
h1=plot(Site3C.date,Site3C.DDE./Site3C.DDE(1),'o');
h2=plot(Site3C.date,Site3C.DDMU./Site3C.DDMU(1),'o');
h3=plot(Site3C.date,Site3C.DDNU./Site3C.DDNU(1),'o');
h4=plot(Site3C.date,Site3C.PCB118./Site3C.PCB118(1),'o');
h5=plot(Site3C.date,Site3C.PCB153./Site3C.PCB153(1),'o');
h6=plot(Site3C.date,Site3C.PCB138./Site3C.PCB138(1),'o');
set(h1,'markerfacecolor',DDEcol,'markeredgecolor','none','markersize',10)
set(h2,'markerfacecolor',DDMUcol,'markeredgecolor','none','markersize',10)
set(h3,'markerfacecolor',DDNUcol,'markeredgecolor','none','markersize',10)
set(h4,'markerfacecolor',PCB118col,'markeredgecolor','none','markersize',10)
set(h5,'markerfacecolor',PCB153col,'markeredgecolor','none','markersize',10)
set(h6,'markerfacecolor',PCB138col,'markeredgecolor','none','markersize',10)
text(1981,4.5,'a) Site 3C')
legend([h1;h2;h3;h4;h5;h6],'DDE','DDMU','DDNU','PCB 118','PCB 153','PCB 138')
%xlabel('Year')
ylim([0 5])
ylabel('Inventory / Initial Inventory')

subplot(212)
plot([1980 2015],[1,1],'--k')
hold on
plot(Site6C.date,Site6C.DDE./Site6C.DDE(1),'-','linewidth',2,'color',DDEcol);
plot(Site6C.date,Site6C.DDMU./Site6C.DDMU(1),'-','linewidth',2,'color',DDMUcol);
plot(Site6C.date,Site6C.DDNU./Site6C.DDNU(1),'-','linewidth',2,'color',DDNUcol);
plot(Site6C.date,Site6C.PCB118./Site6C.PCB118(1),'--','linewidth',2,'color',PCB118col);
plot(Site6C.date,Site6C.PCB153./Site6C.PCB153(1),'--','linewidth',2,'color',PCB153col);
plot(Site6C.date,Site6C.PCB138./Site6C.PCB138(1),'--','linewidth',2,'color',PCB138col);
h1=plot(Site6C.date,Site6C.DDE./Site6C.DDE(1),'o');
h2=plot(Site6C.date,Site6C.DDMU./Site6C.DDMU(1),'o');
h3=plot(Site6C.date,Site6C.DDNU./Site6C.DDNU(1),'o');
h4=plot(Site6C.date,Site6C.PCB118./Site6C.PCB118(1),'o');
h5=plot(Site6C.date,Site6C.PCB153./Site6C.PCB153(1),'o');
h6=plot(Site6C.date,Site6C.PCB138./Site6C.PCB138(1),'o');
set(h1,'markerfacecolor',DDEcol,'markeredgecolor','none','markersize',10)
set(h2,'markerfacecolor',DDMUcol,'markeredgecolor','none','markersize',10)
set(h3,'markerfacecolor',DDNUcol,'markeredgecolor','none','markersize',10)
set(h4,'markerfacecolor',PCB118col,'markeredgecolor','none','markersize',10)
set(h5,'markerfacecolor',PCB153col,'markeredgecolor','none','markersize',10)
set(h6,'markerfacecolor',PCB138col,'markeredgecolor','none','markersize',10)
text(1981,4.5,'b) Site 6C')
legend([h1;h2;h3;h4;h5;h6],'DDE','DDMU','DDNU','PCB 118','PCB 153','PCB 138')
xlabel('Year')
ylim([0 5])
ylabel('Inventory / Initial Inventory')

%% Fig 2 - Plot inventories / mean inventory
figure(2);clf
subplot(211)
plot([1980 2015],[1,1],'--k')
hold on
plot(Site3C.date,Site3C.DDE./mean(Site3C.DDE),'-','linewidth',2,'color',DDEcol);
plot(Site3C.date,Site3C.DDMU./mean(Site3C.DDMU),'-','linewidth',2,'color',DDMUcol);
plot(Site3C.date,Site3C.DDNU./mean(Site3C.DDNU),'-','linewidth',2,'color',DDNUcol);
plot(Site3C.date,Site3C.PCB118./mean(Site3C.PCB118),'--','linewidth',2,'color',PCB118col);
plot(Site3C.date,Site3C.PCB153./mean(Site3C.PCB153),'--','linewidth',2,'color',PCB153col);
plot(Site3C.date,Site3C.PCB138./mean(Site3C.PCB138),'--','linewidth',2,'color',PCB138col);
h1=plot(Site3C.date,Site3C.DDE./mean(Site3C.DDE),'o');
h2=plot(Site3C.date,Site3C.DDMU./mean(Site3C.DDMU),'o');
h3=plot(Site3C.date,Site3C.DDNU./mean(Site3C.DDNU),'o');
h4=plot(Site3C.date,Site3C.PCB118./mean(Site3C.PCB118),'o');
h5=plot(Site3C.date,Site3C.PCB153./mean(Site3C.PCB153),'o');
h6=plot(Site3C.date,Site3C.PCB138./mean(Site3C.PCB138),'o');
set(h1,'markerfacecolor',DDEcol,'markeredgecolor','none','markersize',10)
set(h2,'markerfacecolor',DDMUcol,'markeredgecolor','none','markersize',10)
set(h3,'markerfacecolor',DDNUcol,'markeredgecolor','none','markersize',10)
set(h4,'markerfacecolor',PCB118col,'markeredgecolor','none','markersize',10)
set(h5,'markerfacecolor',PCB153col,'markeredgecolor','none','markersize',10)
set(h6,'markerfacecolor',PCB138col,'markeredgecolor','none','markersize',10)
text(1981,4.5,'a) Site 3C')
legend([h1;h2;h3;h4;h5;h6],'DDE','DDMU','DDNU','PCB 118','PCB 153','PCB 138')
%xlabel('Year')
ylim([0 5])
ylabel('Inventory / Mean Inventory')

subplot(212)
plot([1980 2015],[1,1],'--k')
hold on
plot(Site6C.date,Site6C.DDE./mean(Site6C.DDE),'-','linewidth',2,'color',DDEcol);
plot(Site6C.date,Site6C.DDMU./mean(Site6C.DDMU),'-','linewidth',2,'color',DDMUcol);
plot(Site6C.date,Site6C.DDNU./mean(Site6C.DDNU),'-','linewidth',2,'color',DDNUcol);
plot(Site6C.date,Site6C.PCB118./mean(Site6C.PCB118),'--','linewidth',2,'color',PCB118col);
plot(Site6C.date,Site6C.PCB153./mean(Site6C.PCB153),'--','linewidth',2,'color',PCB153col);
plot(Site6C.date,Site6C.PCB138./mean(Site6C.PCB138),'--','linewidth',2,'color',PCB138col);
h1=plot(Site6C.date,Site6C.DDE./mean(Site6C.DDE),'o');
h2=plot(Site6C.date,Site6C.DDMU./mean(Site6C.DDMU),'o');
h3=plot(Site6C.date,Site6C.DDNU./mean(Site6C.DDNU),'o');
h4=plot(Site6C.date,Site6C.PCB118./mean(Site6C.PCB118),'o');
h5=plot(Site6C.date,Site6C.PCB153./mean(Site6C.PCB153),'o');
h6=plot(Site6C.date,Site6C.PCB138./mean(Site6C.PCB138),'o');
set(h1,'markerfacecolor',DDEcol,'markeredgecolor','none','markersize',10)
set(h2,'markerfacecolor',DDMUcol,'markeredgecolor','none','markersize',10)
set(h3,'markerfacecolor',DDNUcol,'markeredgecolor','none','markersize',10)
set(h4,'markerfacecolor',PCB118col,'markeredgecolor','none','markersize',10)
set(h5,'markerfacecolor',PCB153col,'markeredgecolor','none','markersize',10)
set(h6,'markerfacecolor',PCB138col,'markeredgecolor','none','markersize',10)
text(1981,4.5,'b) Site 6C')
legend([h1;h2;h3;h4;h5;h6],'DDE','DDMU','DDNU','PCB 118','PCB 153','PCB 138')
xlabel('Year')
ylim([0 5])
ylabel('Inventory / Mean Inventory')
%% Fig 3 - Plot inventories * mean(PCB153)/PCB153
% I think these are the values we want to fit Bateman coeff. to
figure(3);clf
subplot(211)
fac = mean(Site3C.PCB153)./Site3C.PCB153;
semilogy([1980 2015],[1,1],'--k')
hold on
semilogy(Site3C.date,Site3C.DDE.*fac,'-','linewidth',2,'color',DDEcol);
semilogy(Site3C.date,Site3C.DDMU.*fac,'-','linewidth',2,'color',DDMUcol);
semilogy(Site3C.date,Site3C.DDNU.*fac,'-','linewidth',2,'color',DDNUcol);
semilogy(Site3C.date,Site3C.PCB118.*fac,'--','linewidth',2,'color',PCB118col);
semilogy(Site3C.date,Site3C.PCB153.*fac,'--','linewidth',2,'color',PCB153col);
semilogy(Site3C.date,Site3C.PCB138.*fac,'--','linewidth',2,'color',PCB138col);
h1=semilogy(Site3C.date,Site3C.DDE.*fac,'o');
h2=semilogy(Site3C.date,Site3C.DDMU.*fac,'o');
h3=semilogy(Site3C.date,Site3C.DDNU.*fac,'o');
h4=semilogy(Site3C.date,Site3C.PCB118.*fac,'o');
h5=semilogy(Site3C.date,Site3C.PCB153.*fac,'o');
h6=semilogy(Site3C.date,Site3C.PCB138.*fac,'o');
set(h1,'markerfacecolor',DDEcol,'markeredgecolor','none','markersize',10)
set(h2,'markerfacecolor',DDMUcol,'markeredgecolor','none','markersize',10)
set(h3,'markerfacecolor',DDNUcol,'markeredgecolor','none','markersize',10)
set(h4,'markerfacecolor',PCB118col,'markeredgecolor','none','markersize',10)
set(h5,'markerfacecolor',PCB153col,'markeredgecolor','none','markersize',10)
set(h6,'markerfacecolor',PCB138col,'markeredgecolor','none','markersize',10)
text(1981,3.5,'a) Site 3C')
legend([h1;h2;h3;h4;h5;h6],'DDE','DDMU','DDNU','PCB 118','PCB 153','PCB 138')
%xlabel('Year')
ylim([0 5])
ylabel('Inventory * Mean(PCB 153)/PCB 153')

subplot(212)
fac = mean(Site6C.PCB153)./Site6C.PCB153;
semilogy([1980 2015],[1,1],'--k')
hold on
semilogy(Site6C.date,Site6C.DDE.*fac,'-','linewidth',2,'color',DDEcol);
semilogy(Site6C.date,Site6C.DDMU.*fac,'-','linewidth',2,'color',DDMUcol);
semilogy(Site6C.date,Site6C.DDNU.*fac,'-','linewidth',2,'color',DDNUcol);
semilogy(Site6C.date,Site6C.PCB118.*fac,'--','linewidth',2,'color',PCB118col);
semilogy(Site6C.date,Site6C.PCB153.*fac,'--','linewidth',2,'color',PCB153col);
semilogy(Site6C.date,Site6C.PCB138.*fac,'--','linewidth',2,'color',PCB138col);
h1=semilogy(Site6C.date,Site6C.DDE.*fac,'o');
h2=semilogy(Site6C.date,Site6C.DDMU.*fac,'o');
h3=semilogy(Site6C.date,Site6C.DDNU.*fac,'o');
h4=semilogy(Site6C.date,Site6C.PCB118.*fac,'o');
h5=semilogy(Site6C.date,Site6C.PCB153.*fac,'o');
h6=semilogy(Site6C.date,Site6C.PCB138.*fac,'o');
set(h1,'markerfacecolor',DDEcol,'markeredgecolor','none','markersize',10)
set(h2,'markerfacecolor',DDMUcol,'markeredgecolor','none','markersize',10)
set(h3,'markerfacecolor',DDNUcol,'markeredgecolor','none','markersize',10)
set(h4,'markerfacecolor',PCB118col,'markeredgecolor','none','markersize',10)
set(h5,'markerfacecolor',PCB153col,'markeredgecolor','none','markersize',10)
set(h6,'markerfacecolor',PCB138col,'markeredgecolor','none','markersize',10)
text(1981,3.5,'b) Site 6C')
legend([h1;h2;h3;h4;h5;h6],'DDE','DDMU','DDNU','PCB 118','PCB 153','PCB 138')
xlabel('Year')
ylim([0 5])
ylabel('Inventory Mean(PCB 153)/PCB 153')
%% Fig 4 - Plot (Inventory / Intial Inventory) * mean(PCB153)/PCB153
figure(4);clf
subplot(211)
fac = mean(Site3C.PCB153)./Site3C.PCB153;
plot([1980 2015],[1,1],'--k')
hold on
plot(Site3C.date,(Site3C.DDE./Site3C.DDE(1)).*fac,'-','linewidth',2,'color',DDEcol);
plot(Site3C.date,(Site3C.DDMU./Site3C.DDMU(1)).*fac,'-','linewidth',2,'color',DDMUcol);
plot(Site3C.date,(Site3C.DDNU./Site3C.DDNU(1)).*fac,'-','linewidth',2,'color',DDNUcol);
plot(Site3C.date,(Site3C.PCB118./Site3C.PCB118(1)).*fac,'--','linewidth',2,'color',PCB118col);
plot(Site3C.date,(Site3C.PCB153./Site3C.PCB153(1)).*fac,'--','linewidth',2,'color',PCB153col);
plot(Site3C.date,(Site3C.PCB138./Site3C.PCB138(1)).*fac,'--','linewidth',2,'color',PCB138col);
h1=plot(Site3C.date,(Site3C.DDE./Site3C.DDE(1)).*fac,'o');
h2=plot(Site3C.date,(Site3C.DDMU./Site3C.DDMU(1)).*fac,'o');
h3=plot(Site3C.date,(Site3C.DDNU./Site3C.DDNU(1)).*fac,'o');
h4=plot(Site3C.date,(Site3C.PCB118./Site3C.PCB118(1)).*fac,'o');
h5=plot(Site3C.date,(Site3C.PCB153./Site3C.PCB153(1)).*fac,'o');
h6=plot(Site3C.date,(Site3C.PCB138./Site3C.PCB138(1)).*fac,'o');
set(h1,'markerfacecolor',DDEcol,'markeredgecolor','none','markersize',10)
set(h2,'markerfacecolor',DDMUcol,'markeredgecolor','none','markersize',10)
set(h3,'markerfacecolor',DDNUcol,'markeredgecolor','none','markersize',10)
set(h4,'markerfacecolor',PCB118col,'markeredgecolor','none','markersize',10)
set(h5,'markerfacecolor',PCB153col,'markeredgecolor','none','markersize',10)
set(h6,'markerfacecolor',PCB138col,'markeredgecolor','none','markersize',10)
text(1981,4.5,'a) Site 3C')
legend([h1;h2;h3;h4;h5;h6],'DDE','DDMU','DDNU','PCB 118','PCB 153','PCB 138')
%xlabel('Year')
ylim([0 5])
ylabel('Inventory / Initial Inventory')

subplot(212)
fac = mean(Site6C.PCB153)./Site6C.PCB153;
plot([1980 2015],[1,1],'--k')
hold on
plot(Site6C.date,(Site6C.DDE./Site6C.DDE(1)).*fac,'-','linewidth',2,'color',DDEcol);
plot(Site6C.date,(Site6C.DDMU./Site6C.DDMU(1)).*fac,'-','linewidth',2,'color',DDMUcol);
plot(Site6C.date,(Site6C.DDNU./Site6C.DDNU(1)).*fac,'-','linewidth',2,'color',DDNUcol);
plot(Site6C.date,(Site6C.PCB118./Site6C.PCB118(1)).*fac,'--','linewidth',2,'color',PCB118col);
plot(Site6C.date,(Site6C.PCB153./Site6C.PCB153(1)).*fac,'--','linewidth',2,'color',PCB153col);
plot(Site6C.date,(Site6C.PCB138./Site6C.PCB138(1)).*fac,'--','linewidth',2,'color',PCB138col);
h1=plot(Site6C.date,(Site6C.DDE./Site6C.DDE(1)).*fac,'o');
h2=plot(Site6C.date,(Site6C.DDMU./Site6C.DDMU(1)).*fac,'o');
h3=plot(Site6C.date,(Site6C.DDNU./Site6C.DDNU(1)).*fac,'o');
h4=plot(Site6C.date,(Site6C.PCB118./Site6C.PCB118(1)).*fac,'o');
h5=plot(Site6C.date,(Site6C.PCB153./Site6C.PCB153(1)).*fac,'o');
h6=plot(Site6C.date,(Site6C.PCB138./Site6C.PCB138(1)).*fac,'o');
set(h1,'markerfacecolor',DDEcol,'markeredgecolor','none','markersize',10)
set(h2,'markerfacecolor',DDMUcol,'markeredgecolor','none','markersize',10)
set(h3,'markerfacecolor',DDNUcol,'markeredgecolor','none','markersize',10)
set(h4,'markerfacecolor',PCB118col,'markeredgecolor','none','markersize',10)
set(h5,'markerfacecolor',PCB153col,'markeredgecolor','none','markersize',10)
set(h6,'markerfacecolor',PCB138col,'markeredgecolor','none','markersize',10)
text(1981,4.5,'b) Site 6C')
legend([h1;h2;h3;h4;h5;h6],'DDE','DDMU','DDNU','PCB 118','PCB 153','PCB 138')
xlabel('Year')
ylim([0 5])
ylabel('Inventory / Initial Inventory')