function [a,b,r2,sa,sb ] = lsfitlog_pif(x,y,mcolor)
% LSFIT  Least-squares fit
% [a,b, r2, sa, sb ] = lsfit(x,y,mcolor)
%
% (Not the same as my library version)
%
% Least-squares fit of
%   y = a + b * x
% x and y must be column vectors of same length.
% Sa and sb are standard error of offset and slope.
% Will plot a dashed line of mcolor if mcolor is present AND
% the slope is significantly diff. from zero at the 90% CL.
%
% r2 calculated according to Sachs(1982) p. 389

%    Chris Sherwood, UW and USGS
%    Last revised May 4, 2000
%
% output switched back to R2 from adj R2 PJD Apr 2011
echo off
format compact
if(nargin<3),iplot=0,end;

% matlab ls method
% x = [x ones(x) ];
% b = x\y

% or, equivalently
% b = (x'*x)\(x'*y)
% b = polyfit( log( z ./ za ), y, 1 )
% b = inv(x'*x)*(x'*y)
% predictions
% yhat = x*b;
% or
% yhat2 = polyval( b2, log( z ./ za ) );

% or, longhand
n = max(size(x));
sumx = sum(x);
sumy = sum(log(y));
sumx2 = sum(x .* x);
sumy2 = sum(log(y) .* log(y));
sumxy = sum(x .* log(y));

% (see Taylor, p. 157)
% del = n*sumx2 - sumx*sumx;
% a = (1 ./del)*(sumx2*sumy - sumx*sumxy)
% b = (1 ./del)*(n*sumxy-sumx*sumy)
% yhat = [x ones(x)]*[ b; a ];
% varY = ( 1 ./(n-2) )*sum( (y-yhat).^2 );
% uncertainty in a = b(2)
% varA = varY * sumx2/del;
% uncertainty in b = b(1)
% varB = n*varY/del;
% sdp = sqrt( varB );
% r2  = sum( (yhat-mean(y)).^2 ) / sum( (y-mean(y)).^2 )

% (Sachs, p. 417)
Qx = sumx2-sumx^2/n;
Qy = sumy2-sumy^2/n;
Qxy = sumxy-(1/n)*sumx*sumy;

xbar = sumx/n;
ybar = sumy/n;

b = Qxy/Qx
% or b = (sumxy-(sumx*sumy)/n)/(sumx2-sumx^2/n)
a = (sumy-b*sumx)/n

sx = sqrt(Qx/(n-1));
sy = sqrt(Qy/(n-1));
r = Qxy/sqrt(Qx*Qy);
r2 = r*r
adjr2 = 1-(1-r2).*(n-1)./(n-2);
Qydotx = Qy-b*Qxy;
sydotx = sqrt( Qydotx/(n-2) );
% or sydotx = sy*sqrt( (1-r2)*(n-1)/(n-2) );

% s.d. of intercept and slope
sb = sydotx/sqrt(Qx);
sa = sydotx*(sqrt(1/n+xbar^2/Qx));
%fprintf(1,'lsfit: \n')
fprintf(1,'slope: %f +- %f intcpt: %f +- %f r2: %f\n',b,sb,a,sa,r2);

%t = 2.132; %n-2=4, two sided, alpha = .9
ttable=[2 2.92;...
	3 2.353;...
	4 2.132;...
	5 2.015;...
	6 1.943;...
	7 1.895;...
	8 1.860;...
	9 1.833;...
       10 1.812;...
       15 1.753;...
       20 1.725;...
       25 1.708;...
       30 1.679;...
       60 1.671;...
      100 1.660;...
     1000 1.646;...
     1e10 1.645];
df = n-2;
t = interp1(ttable(:,1),ttable(:,2),df);
fprintf(1,'DF = %d, alpha = 0.9, t = %f and 90pct CL about slope = %f\n\n',...
	df,t,t*sb);

xline = linspace(min(x),max(x),20);
yline = a+b*xline;
syhatdot = sydotx*sqrt(1+1/n+((xline-xbar).^2)./Qx);
yplus = yline+syhatdot;
yminus = yline-syhatdot;
yhat = a+b*x;
residuals = (log(y) - yhat)';
% if(nargin>2),
% if( abs(b)-t*sb > 0 ),
%   % slope is significant
%   hold on
%   lc = ['--',mcolor];
%   plot(xline,exp(yline),lc,'linewidth',1)
% end
% end

[rho,pval] = corrcoef(x,log(y));


if(nargin>2 & length(pval) >1),
if( pval(1,2) <= 0.1 )
  % correlation is significant at level specified in above line
  hold on
  lc = ['--',mcolor];
  plot(xline,exp(yline),lc,'linewidth',1.5)
end
end



