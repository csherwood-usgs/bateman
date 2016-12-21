% decay_coeff_calc.m - Estimate decay coeffs using two-point estimates
%
% by Patrick Dickhudt  12-Apr-2010
% added to this repo by csherwood@usgs.gov on 21 Dec 2016
% This is a two-point calc. approach using Batemam eqns.

sta = '522w';  % define station to use for calculation ('522', '3C', or '6C')

%% specify concentrations from Eganhouse analysis
% station 522 - USGS station near LACSD 3C
yr522 = [1992 2003];
dde522 = [216.6 123];   % ug/cm2
ddmu522 = [64.96 86.70];  % ug/cm2
ddnu522 = [13.60 18.07];  % ug/cm2

ddewt = 318.03;  % g/mol
ddmuwt = 283.58;  % g/mol
ddnuwt = 249.1352;  % g/mol

% station 3C
yr3c = [1991 2005];
dde3c = [307 154.4];  
ddmu3c = [78.3 106.8];

% station 6c
yr6c = [1991 2005];
dde6c = [1279.1 1030.8];
ddmu6c = [244.4 253.5];

yunit = '\mug cm^-^2';
switch sta
    case '522'
        yr = yr522;
        dde = dde522;
        ddmu = ddmu522;
        ddnu = ddnu522;     
    case '522w'
        yr = yr522;
        dde = dde522./ddewt;
        ddmu = ddmu522./ddmuwt;
        ddnu = ddnu522./ddnuwt;
        yunit = '\mumol cm^-^2';
    case '3C'
        yr = yr3c;
        dde = dde3c;
        ddmu = ddmu3c;
        ddnu = [nan nan];
        case '6C'
        yr = yr6c;
        dde = dde6c;
        ddmu = ddmu6c;
        ddnu = [nan nan];
end

dt = diff(yr);

dde(1) = .54;
lam1 = log(dde(1)/dde(2))./dt;



%% iteratively solve for lam2
lam2 = .05;
ind = 0.0001;

N2 = ddmu(2);
N2i = 0;

while abs(diff([N2 N2i])) > N2*.01
    
    if N2i > N2
    lam2 = lam2+ind;
    1
    elseif N2i < N2 
    lam2 = lam2-ind;
    2
    end

    N2i = lam1./(lam2-lam1).*dde(1).*(exp(-lam1.*dt)-exp(-lam2.*dt))...
   + ddmu(1).*exp(-lam2.*dt);

end

%% iteratively solve for lam3
ind = 0.0001;
if ~isnan(ddnu(1))
lam3 = 0.05
N3 = ddnu(2);
N3i = 0;

while abs(diff([N3 N3i])) > N3*.01
    
    if N3i > N3
    lam3 = lam3+ind;
    elseif N3i < N3 
    lam3 = lam3-ind;
    end

    if lam3 ~= lam1 & lam3 ~= lam2
    N3i = dde(1)*((lam1*lam2)/((lam2-lam1)*(lam3-lam1)))*(exp(-lam1*dt)-exp(-lam3*dt))...
   +ddmu(1)*(lam2/(lam3-lam2))*(exp(-lam2*dt)-exp(-lam3*dt))...
   -dde(1)*(lam1*lam2)/((lam2-lam1)*(lam3-lam2))*(exp(-lam2*dt)-exp(-lam3*dt))...
   +ddnu(1)*exp(-lam3*dt);
    end
end

else
    lam3 = nan;
end
%% plot data with decay constant fit time series projections
fsz = 12;  % fontsize
set(0,'defaultaxesfontsize',fsz)
set(0,'defaulttextfontsize',fsz)

t = 0:100;
yrp = yr(1)+t;
[N1t,N2t,N3t] = bateman(dde(1),ddmu(1),ddnu(1),[lam1 lam2 lam3],t);

ms = 8;

figure(1)
clf
plot(yr,dde,'b^','markersize',ms,'markerfacecolor','b')
hold on
plot(yr,ddmu,'go','markersize',ms,'markerfacecolor','g')
plot(yr,ddnu,'rs','markersize',ms,'markerfacecolor','r')
plot(yrp,N1t,'b-','linewidth',1.5)
plot(yrp,N2t,'g-','linewidth',1.5)
plot(yrp,N3t,'r-','linewidth',1.5)

xlabel('Year')
ylabel(['Inventory (' yunit ')'])
l=legend('DDE','DDMU','DDNU',['\lambda_1 = ' num2str(lam1,3) ' yr^-^1'],...
    ['\lambda_2 = ' num2str(lam2,3) ' yr^-^1'],['\lambda_3 = ' num2str(lam3,3) ' yr^-^1']);
set(l,'box','off')

%save2pdf('DDE_mu_nu_decayfit',gcf,300)

[N1t2,N2t2,N3t2] = bateman(dde(1),ddmu(1),ddnu(1),[0.052 0.07 0.161],t);

figure(1)
plot(yrp,N1t2,'b--','linewidth',1.5)
plot(yrp,N2t2,'g--','linewidth',1.5)
plot(yrp,N3t2,'r--','linewidth',1.5)
l=legend('DDE','DDMU','DDNU',['\lambda_1 = ' num2str(lam1,3) ' yr^-^1'],...
    ['\lambda_2 = ' num2str(lam2,3) ' yr^-^1'],['\lambda_3 = ' num2str(lam3,3) ' yr^-^1'],...
    '\lambda_1_e = 0.052 yr^-^1','\lambda_2_e = 0.070 yr^-^1','\lambda_3_e = 0.161 yr^-^1');
set(l,'box','off')

%save2pdf('DDE_mu_nu_decayfit_wEganhousefits',gcf,300)

%% try to figure out year when DDMU and DDNU = ~0
y1 = 1978;
dty1 = y1 - yr(1);
yreb = y1+(0:50);

lam1 = lam1;

if(0)
    lper = .22;
    % find lam1 with some loss
    ddel = diff(dde);
    ddeper = dde(1)*lper;
lam1 = log((dde(1)-ddeper)/dde(2))./dt

% find lam2 with loss
lam2 = .05;
ind = 0.0001;

N2i = 0;
ddmuper = ddmu(1).*lper;
N2 = ddmu(2);
while abs(diff([N2 N2i])) > 0.1
    
    if N2i > N2
    lam2 = lam2+ind;
    1
    elseif N2i < N2 
    lam2 = lam2-ind;
    2
    end

    N2i = lam1./(lam2-lam1).*(dde(1)-ddeper).*(exp(-lam1.*dt)-exp(-lam2.*dt))...
   + (ddmu(1)-ddmuper).*exp(-lam2.*dt);

end

% iteratively solve for lam3
ind = 0.0001;
if ~isnan(ddnu(1))
lam3 = 0.05
N3 = ddnu(2);
N3i = 0;
ddnuper = ddnu(1).*lper;

while abs(diff([N3 N3i])) > 0.1
    
    if N3i > N3
    lam3 = lam3+ind;
    elseif N3i < N3 
    lam3 = lam3-ind;
    end

    if lam3 ~= lam1 & lam3 ~= lam2
    N3i = (dde(1)-ddeper)*((lam1*lam2)/((lam2-lam1)*(lam3-lam1)))*(exp(-lam1*dt)-exp(-lam3*dt))...
   +(ddmu(1)-ddmuper)*(lam2/(lam3-lam2))*(exp(-lam2*dt)-exp(-lam3*dt))...
   -(dde(1)-ddeper)*(lam1*lam2)/((lam2-lam1)*(lam3-lam2))*(exp(-lam2*dt)-exp(-lam3*dt))...
   +(ddnu(1)-ddnuper)*exp(-lam3*dt);
    end
end

else
    lam3 = nan;
end
end

[N1y1,N2b,N3b] = bateman(dde(1),ddmu(1),ddnu(1),[lam1 lam2 lam3],dty1);

[N1eb,N2eb,N3eb] = bateman(N1y1,0,0,[lam1 lam2 lam3],0:50);

figure(2)
clf
plot(yr,dde,'b^','markersize',ms,'markerfacecolor','b')
hold on
plot(yr,ddmu,'go','markersize',ms,'markerfacecolor','g')
plot(yr,ddnu,'rs','markersize',ms,'markerfacecolor','r')
plot(yreb,N1eb,'b-','linewidth',1.5)
plot(yreb,N2eb,'g-','linewidth',1.5)
plot(yreb,N3eb,'r-','linewidth',1.5)

xlabel('Year')
ylabel('Inventory (\mug cm^-^2)')
l=legend('DDE','DDMU','DDNU',['\lambda_1 = ' num2str(lam1,3) ' yr^-^1'],...
    ['\lambda_2 = ' num2str(lam2,3) ' yr^-^1'],['\lambda_3 = ' num2str(lam3,3) ' yr^-^1']);
set(l,'box','off')
