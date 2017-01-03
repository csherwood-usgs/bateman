% adjust_inventory - Evaluate how best to adjust DDE inventories
%
% Thinking here is that PCB inventories should not change, so any changes
% could be interpreted as sample variation. But which PCB to normalize by?
% And how to tell which is best?
% Evaluate all three separately and also the average.
% Metrics are:
%   1) Mean and 2) max absolute deviation of PCB inv. from long-term mean,
%   3) do they have a trend, and 4) "goodness of log-linear fit" to decay of DDE.

% csherwood@usgs.gov
% 3 Jan 2016

% colors for consistent plots
define_colors
% Load molar inventories for cores at 3C and 6C, per Bob Eganhouse, Dec
% 2016. The .mat version was created by inventories.m
inventories

figure(1); clf;
% loop through two sites
for i=1:2
   % generic name
   if i==1
      ts = 'a) Site 3C'
      I = Site3C;
   end
   if i==2
      ts = 'b) Site 6C'
      I = Site6C;
   end
   
   I.PCBall = I.PCB118+I.PCB153+I.PCB138;
   fprintf(1,'PCBall adj:\n')
   dist(mean(I.PCBall)./I.PCBall);
   
   %    PCB118mad = mean(abs( (I.PCB118-mean(I.PCB118))/mean(I.PCB118) ) )
   %    PCB118max = max(abs( (I.PCB118-mean(I.PCB118))/mean(I.PCB118) ) )
   %    PCB153mad = mean(abs( (I.PCB153-mean(I.PCB153))/mean(I.PCB153) ) )
   %    PCB153max = max(abs( (I.PCB153-mean(I.PCB153))/mean(I.PCB153) ) )
   %    PCB138mad = mean(abs( (I.PCB138-mean(I.PCB138))/mean(I.PCB138) ) )
   %    PCB138max = max(abs( (I.PCB138-mean(I.PCB138))/mean(I.PCB138) ) )
   %    PCBallmad = mean(abs( (I.PCBall-mean(I.PCBall))/mean(I.PCBall) ) )
   %    PCBallmax = max(abs( (I.PCBall-mean(I.PCBall))/mean(I.PCBall) ) )
   
   subplot(2,1,i)
   plot([1980 2105],[1 1],'--k');
   hold on
   h1=plot(I.date,I.PCB118./mean(I.PCB118),'o');
   h2=plot(I.date,I.PCB153./mean(I.PCB153),'o');
   h3=plot(I.date,I.PCB138./mean(I.PCB138),'o');
   h4=plot(I.date,I.PCBall./mean(I.PCBall),'o');
   set(h1,'markerfacecolor',PCB118col','markeredgecolor',Totcol,'markersize',10);
   set(h2,'markerfacecolor',PCB153col','markeredgecolor',Totcol,'markersize',10);
   set(h3,'markerfacecolor',PCB138col','markeredgecolor',Totcol,'markersize',10);
   set(h4,'markerfacecolor',Totcol','markeredgecolor',Totcol,'markersize',10);
   ylim([.4,1.6])
   xlim([1980, 2015])
   ylabel('Normalized Inventory I/Ibar')
   xlabel('Year')
   legend([h1;h2;h3;h4],'PCB 118','PCB 153','PCB 138','All PCBs')
   text(1981,1.5,ts);
   
   % Check to see if there is a temporal trend in PCBs
   ts
   [a,b, r2, sa, sb, hdot ] = lsfit(I.date,I.PCB118./mean(I.PCB118),0);
   fprintf(1,'PCB118: slope = %f +/- %f, r2 = %f\n',b,sb,r2);
   [a,b, r2, sa, sb, hdot ] = lsfit(I.date,I.PCB153./mean(I.PCB153),0);
   fprintf(1,'PCB153: slope = %f +/- %f, r2 = %f\n',b,sb,r2);
   [a,b, r2, sa, sb, hdot ] = lsfit(I.date,I.PCB138./mean(I.PCB138),0);
   fprintf(1,'PCB138: slope = %f +/- %f, r2 = %f\n',b,sb,r2);
   [a,b, r2, sa, sb, hdot ] = lsfit(I.date,I.PCBall./mean(I.PCBall),0);
   fprintf(1,'PCBall: slope = %f +/- %f, r2 = %f\n',b,sb,r2);
   
   
end

%% evaluate the log fit after normalizing
global C0
% loop through two sites
for i=1:2
   
   % generic name
   if i==1
      ts = 'Site 3C'
      I = Site3C;
   end
   if i==2
      ts = 'Site 6C'
      I = Site6C;
   end
   I.PCBall = I.PCB118+I.PCB153+I.PCB138;
   
   figure(i+1);clf
   
   % These are the adjustments to DDE inventory
   adj = zeros(length(I.PCB118),4)
   adj(:,1) = mean(I.PCB118)./I.PCB118
   adj(:,2) = mean(I.PCB153)./I.PCB153
   adj(:,3) = mean(I.PCB138)./I.PCB138
   adj(:,4) = mean(I.PCBall)./I.PCBall
   tt ={{'a) PCB 118 '};...
      {'b) PCB 153 '};...
      {'c) PCB 138 '};...
      {'d) All PCBs'};}
   
   for j=1:4
      % loop through four adjustments
      subplot(2,2,j)
      
      C0 = I.DDE(1)*adj(1,j);
      x = I.date-I.date(1);
      y = I.DDE.*adj(:,j);      % "data"
      sfsd = 0.05*y;       % guess at measurement uncertainty
      pin = [-0.04];       % initial parameters
      stol = 1e-4 ;        % tolerance (fractional)
      niter = 30;          % default is 20
      wt = 1 ./sfsd; % weights
      
      % non-linear fit for DDE decay only from Glover, Jenkins, Doney
      [cnl,pnl,kvg,iter,corp,covp,covr,stdresid,Z,r2]= ...
         nlleasqr(x,y,pin,'decayfunc',stol,niter,wt);
      
      % calculate Chi^2
      chat_nl = C0*exp(pnl(1).*(I.date-I.date(1)));
      h1 = semilogy(I.date,y,'o')
      set(h1,'markerfacecolor',DDEcol','markeredgecolor',Totcol,'markersize',10)
      hold on
      h4=semilogy(I.date,chat_nl,'-c','linewidth',2); set(h4,'color',DDEcol);
      xlim([1980 2015])
      
      % place labels on some panels
      if(j==1), title(ts); end
      if(j==3), ylabel('Adjusted {\itp,p''}-DDE Inventory (mmol/cm^2)'); end
      if(j==3 | j==4), xlabel('Year'); end
      
      % mess around with text strings
      [X2_nl,PX_nl,df_nl]=chisq(y, chat_nl, sfsd.^2, 1);
      chi_str = sprintf('%7.3f',X2_nl)
      lam_str = sprintf('%6.3f',pnl(1))
      tst=['{\chi}^2 = ',chi_str,', {\itk}_1 = ',lam_str]
      
      if(i==1)
         ylim([0.2 1.4]);
         text(1981,0.25,tst);
         text(1981,1.25,tt{j});
      end
      if(i==2)
         ylim([2.0 2.7]);
         text(1981,2.1,tst);
         text(1981,2.66,tt{j});
      end
   end
end
%% Make plots comparing fits and adjusted fits
global C0
% loop through two sites
figure(4); clf;
for i=1:2
   
   % generic name
   if i==1
      ts = 'Site 3C'
      I = Site3C;
   end
   if i==2
      ts = 'Site 6C'
      I = Site6C;
   end
   I.PCBall = I.PCB118+I.PCB153+I.PCB138;
   
   tt ={{'a) Meas. DDE'};...
        {'c) Adj. DDE '};...
        {'b) Meas. DDE'};...
        {'d) Adj. DDE '};}
   
   for j=1:2
      % loop through two adjustments
      % no adjustment
      adj = ones(length(I.PCB118),1)
      if(j==2)
         adj = mean(I.PCBall)./I.PCBall
      end
      if(i==1 & j==1), subplot(221), end
      if(i==1 & j==2), subplot(223), end
      if(i==2 & j==1), subplot(222), end
      if(i==2 & j==2), subplot(224), end
      
      C0 = I.DDE(1)*adj(1);
      x = I.date-I.date(1);
      y = I.DDE.*adj;      % "data"
      sfsd = 0.05*y;       % guess at measurement uncertainty
      pin = [-0.04];       % initial parameters
      stol = 1e-4 ;        % tolerance (fractional)
      niter = 30;          % default is 20
      wt = 1 ./sfsd; % weights
      
      % non-linear fit for DDE decay only from Glover, Jenkins, Doney
      [cnl,pnl,kvg,iter,corp,covp,covr,stdresid,Z,r2]= ...
         nlleasqr(x,y,pin,'decayfunc',stol,niter,wt);
      
      % calculate Chi^2
      chat_nl = C0*exp(pnl(1).*(I.date-I.date(1)));
      h1 = semilogy(I.date,y,'o')
      set(h1,'markerfacecolor',DDEcol','markeredgecolor',Totcol,'markersize',10)
      hold on
      h4=semilogy(I.date,chat_nl,'-c','linewidth',2); set(h4,'color',DDEcol);
      xlim([1980 2015])
      
      % place labels on some panels
      if(j==1), title(ts); end
      if(i==1 & j==1), ylabel('Meas. {\itp,p''}-DDE Inventory ({\mu}mol/cm^2)'); end
      if(i==1 & j==2), ylabel('Adj. {\itp,p''}-DDE Inventory ({\mu}mol/cm^2)'); end
      if(j==2), xlabel('Year'); end
      
      % mess around with text strings
      [X2_nl,PX_nl,df_nl]=chisq(y, chat_nl, sfsd.^2, 1);
      chi_str = sprintf('%7.3f',X2_nl)
      lam_str = sprintf('%6.3f',pnl(1))
      tst=['{{\chi}^2}_{\nu} = ',chi_str,', {\itk}_1 = ',lam_str]
      
      if(i==1 & j==1)
         ylim([0.2 1.7]);
         text(1981,0.25,tst);
         text(1981,1.5,tt{1});
      end
      if(i==1 & j==2)
         ylim([0.2 1.7]);
         text(1981,0.25,tst);
         text(1981,1.5,tt{2});
      end
      if(i==2 & j==1)
         ylim([1.0 3.5]);
         text(1981,1.1,tst);
         text(1981,3.3,tt{3});
      end
      if(i==2 & j==2)
         ylim([1.0 3.5]);
         text(1981,1.1,tst);
         text(1981,3.3,tt{4});
      end

   end
end
