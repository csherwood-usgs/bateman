% seq_inter - Script to iteratively estimate the transfer/decay coeffs and
% calculate dechlorination sequence for molar concentrations of DDE -> DDNU -> DDMU -> ?
% Based on bateman_molar
% csherwood@usgs.gov
% 28 Dec 2016
%
% Needs:
%   bateman
%   define_colors
% For numerical solutions, needs:
%   dcdt3
%   bateman_diff_eq_nested

global lam
close all

% standardize colors
define_colors

% Load molar inventories for cores at 3C and 6C, per Bob Eganhouse, Dec
% 2016. The .mat version was created by inventories.m
load inv
% pick one, assign generic name
I = Site3C;    lam = [.04 .02 0.03]; ts = 'Site 3C';
%I = Site6C;    lam = [.041 .04 0.034]; ts = 'Site 6C';

I.PCBall = I.PCB118+I.PCB153+I.PCB138;
% choose whether to adjust inventory or not

adj = ones(length(I.PCB118),1);      % no adjustement
ylab = '{\itp,p''-}DDE Inventory ({\mu}mol cm^{-2})'
% adjust?
if(1)
   adj = mean(I.PCBall)./I.PCBall     % adjust using all PCBs
   ylab = 'Adjusted {\itp,p''-}DDE Inventory ({\mu}mol cm^{-2})'
end
tmeas = I.date;
invmeas = [I.DDE I.DDMU I.DDNU];
invtot = sum(invmeas,2);

% non-linear fit DDE
global C0
% fit to DDE
C0 = I.DDE(1)*adj(1);
x = I.date-I.date(1);
y = I.DDE.*adj;      % "data"
sfsd = 0.05*y;       % guess at measurement uncertainty
pin = [-0.04];       % initial parameters
stol = 1e-4 ;        % tolerance (fractional)
niter = 30;          % default is 20
wt = 1 ./sfsd; % weights

tstart = tic;
[cnl,pnl,kvg,iter,corp,covp,covr,stdresid,Z,r2]= ...
   nlleasqr(x,y,pin,'decayfunc',stol,niter,wt);
etime = toc(tstart); fprintf(1,'nlleasqr time: %g\n',etime);
chat_nl = C0*exp(pnl(1).*(I.date-I.date(1)));
figure
h4=semilogy(I.date,chat_nl,'-c','linewidth',2); set(h4,'color',DDEcol);
hold on
h5=semilogy(I.date,y,'o'); set(h5,'markerfacecolor',DDEcol,'markersize',12)
[X2_nl,PX_nl,df_nl]=chisq(y, chat_nl, sfsd.^2, 1);
chi_str = sprintf('%7.3f',X2_nl)
lam_str = sprintf('%6.3f',pnl(1))
tst1=['$${\chi}^2 = ',chi_str,' $$'];
tst2=['$${\lambda} = ',lam_str,' $$'];
xlabel('Year')
ylabel(ylab)
title(ts)
text(2010,1,tst1,'interpreter','latex')
text(2010,.9,tst2,'interpreter','latex')

%% Run alot of cases and find minimum X2
% bracket log fit for lam1
lam1 = linspace(.85*(-pnl(1)),1.15*(-pnl(1)), 20 );
nlam1 = length(lam1);
lam2 = linspace(0.00,1.0,50);
lam3 = linspace(0.0,1.0,50);
nlam2 = length(lam2);
nlam3 = length(lam3);
tspan = I.date;
RMS = zeros(nlam1,nlam2,nlam3);
X2 = RMS;
Cmeas = [I.DDE.*adj  I.DDMU.*adj I.DDNU.*adj];
C0 = Cmeas(1,:);
tstart = tic;
for k = 1:nlam1
   for j = 1:nlam3
      for i = 1:nlam2
         lam(1) = lam1(k);
         lam(2) = lam2(i);
         lam(3) = lam3(j);
         [tspan,C]=bateman_diff_eq_nested( tspan, C0, lam );
         resid = C-Cmeas;
         RMS(i,j) = sqrt(sum(sum(resid.^2)));
         X2(i,j) = chisq(C(:),Cmeas(:),1,2);
      end
   end
%    figure(2); clf
%    pcolorjw(lam2,lam3,RMS)
%    xlabel('lam3')
%    ylabel('lam2')
%    colorbar
%    shg
   
   [Yx,Ix]=min(X2);
   [YYx,Jx]=min(Yx);
   [Ix(Jx),Jx];
   
   [Y,I]=min(RMS);
   [YY,J]=min(Y);
   [I(J),J];
   lam2op = lam2(I(J));
   lam3op = lam3(J);
   
   disp([ k Ix(Jx) Jx  X2(Ix(Jx),Jx)  I(J)  J  RMS(I(J),J)])
   lamop = [lam(1) lam2op lam3op]
end
etime = toc(tstart); fprintf(1,'Iteration time: %g\n',etime);

%% redo calcs with best estimate
lamop(1) =0.039
[tspan,C2]=bateman_diff_eq_nested(tspan, C0, lamop);
[t,Cn]=bateman_diff_eq_nested([tspan(1) 2015], C0, lamop);
plot_fit