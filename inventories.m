% Data from spreadsheet e-mailed to CRS from Bob Eganhouse 16-Dec-2016
% "Inventories for C.Sherwood 12-16-2016.xlsx"
%
% Core, Sampling Year, Molar inventory (mmol/cm2)					
% p,p'-DDE	p,p'-DDMU	p,p'-DDNU	PCB 118	PCB 153	PCB 138
% 			log KowSPARC	6.89	6.16	5.71	6.95	7.66	7.71

Site3C.core = {{'3C1'}; {'124B1-DDT'}; {'124B1-CH'}; {'124B1-WCS'}; {'124B1-WC'}};
A=...
[1981.27	1.34	0.07	0.004	0.0081	0.0062	0.0076;...
1992.51	0.71	0.25	0.012	0.0066	0.0049	0.0064;...
2003.58	0.39	0.32	0.036	0.0050	0.0037	0.0050;...
2009.23	0.38	0.52	0.069	0.0076	0.0076	0.0085;...
2010.31	0.41	0.52	0.085	0.0075	0.0072	0.0079];
Site3C.date = A(:,1);
Site3C.DDE = A(:,2);
Site3C.DDMU = A(:,3);
Site3C.DDNU = A(:,4);
Site3C.PCB118 = A(:,5);
Site3C.PCB153 = A(:,6);
Site3C.PCB138 = A(:,7);
Site3C.names = {{'sampling date (decimal year)'},...
  {'p,p''-DDE (mmol/cm2)'},...
  {'p,p''-DDMU (mmol/cm2)'},...
  {'p,p''-DDNU (mmol/cm2)'},...
  {'PCB 118 (mmol/cm2)'},...
  {'PCB 153 (mmol/cm2)'},...
  {'PCB 138 (mmol/cm2)'}}
Site3C.source = {'Data from spreadsheet e-mailed to CRS from Bob Eganhouse 16-Dec-2016 ''Inventories for C.Sherwood 12-16-2016.xlsx'''};

Site6C.core = {{'147B3-BE'} {'147B2-TM'} {'147B1-WCS'} {'147B4-WC'}};
A=...
[1992.52	3.07	0.67	0.026	0.0182	0.0119	0.0152;...
2003.58	2.75	0.87	0.072	0.0177	0.0122	0.0158;...
2009.23	2.37	0.75	0.095	0.0172	0.0095	0.0134;...
2010.31	1.16	0.43	0.046	0.0079	0.0054	0.0065];
Site6C.date = A(:,1);
Site6C.DDE = A(:,2);
Site6C.DDMU = A(:,3);
Site6C.DDNU = A(:,4);
Site6C.PCB118 = A(:,5);
Site6C.PCB153 = A(:,6);
Site6C.PCB138 = A(:,7);
Site6C.names = {{'sampling date (decimal year)'},...
  {'p,p''-DDE (mmol/cm2)'},...
  {'p,p''-DDMU (mmol/cm2)'},...
  {'p,p''-DDNU (mmol/cm2)'},...
  {'PCB 118 (mmol/cm2)'},...
  {'PCB 153 (mmol/cm2)'},...
  {'PCB 138 (mmol/cm2)'}}
Site6C.source = {'Data from spreadsheet e-mailed to CRS from Bob Eganhouse 16-Dec-2016 ''Inventories for C.Sherwood 12-16-2016.xlsx'''};

clear A;
%% Save these for re-loading as .mat file
save inv Site3C Site6C
%% Fig 1 - Plot of inventory / initial inventory
define_colors

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