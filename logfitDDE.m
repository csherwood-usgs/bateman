% logfitDDE - explore fits to DDE loss
global C0
% colors for consistent plots
define_colors
% Load molar inventories for cores at 3C and 6C, per Bob Eganhouse, Dec
% 2016. The .mat version was created by inventories.m
load inv
% generic name
I = Site3C;

%% linear fit in log-lin space
% problem with this one: a) Initial inventory also fit and b) not sure
% about statistics


[a,b,r2,sa,sb ] = lsfitlog_pif(I.date,I.DDE)
chat_loglin = exp(a).*exp(I.date*b)

figure(1); clf;
h1=semilogy(I.date,chat_loglin,'--','linewidth',2)
hold on
h0=semilogy( I.date, I.DDE,'o')
set(h0,'markerfacecolor',DDEcol,'markersize',10,'markeredgecolor',Totcol)

[X2_nl,PX_nl,df_nl]=chisq(I.DDE, chat_nl, sfsd.^2, 2);
ts=sprintf('NL ChiSq= %7.5f, lam= %6.3f',X2_nl,pnl(1))

%% non-linear fit for DDE decay only from Glover, Jenkins, Doney 
C0 = I.DDE(1);
x = I.date-I.date(1);
y = I.DDE;           % "data"
sfsd = 0.1*I.DDE     % guess at uncertainty
pin = [-0.04];       % initial parameters
stol = 1e-4 ;        % tolerance (fractional)
niter = 30;          % default is 20
wt = 1 ./sfsd; % weights

tstart = tic;
[cnl,pnl,kvg,iter,corp,covp,covr,stdresid,Z,r2]= ...
   nlleasqr(x,y,pin,'decayfunc',stol,niter,wt);
etime = toc(tstart); fprintf(1,'nlleasqr time: %g\n',etime);
chat_nl = C0*exp(pnl(1).*(I.date-I.date(1)));
h4=semilogy(I.date,chat_nl,'-c','linewidth',2); set(h4,'color',[.4 .2 .8]);

[X2_nl,PX_nl,df_nl]=chisq(I.DDE, chat_nl, sfsd.^2, 2);
ts=sprintf('NL ChiSq= %7.5f, lam= %6.3f',X2_nl,pnl(1))

