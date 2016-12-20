% adjust_inventory - Evaluate how best to adjust DDE inventories
%
% Thinking here is that PCB inventories should not change, so any changes
% could be interpreted as sample variation. But which PCB to normalize by?
% And how to tell which is best?
% Evaluate all three separately and also the average.
% Metrics are:
%   1) Mean and 2) max absolute deviation of PCB inv. from long-term mean,
%   and 3) "goodness of log-linear fit" to decay of DDE.

% csherwood@usgs.gov
% 20 Dec 2016

% colors for consistent plots
define_colors
% Load molar inventories for cores at 3C and 6C, per Bob Eganhouse, Dec
% 2016. The .mat version was created by inventories.m
load inv
% generic name
I = Site3C;

PCB118.mad = mean(abs( (I.PCB118-mean(I.PCB118))/mean(I.PCB118) ) );
PCB118.max = max(abs( (I.PCB118-mean(I.PCB118))/mean(I.PCB118) ) )
PCB153.mad = mean(abs( (I.PCB153-mean(I.PCB153))/mean(I.PCB153) ) );
PCB153.max = max(abs( (I.PCB153-mean(I.PCB153))/mean(I.PCB153) ) )
PCB138.mad = mean(abs( (I.PCB138-mean(I.PCB138))/mean(I.PCB138) ) );
PCB138.max = max(abs( (I.PCB138-mean(I.PCB138))/mean(I.PCB138) ) )
figure(1); clf
plot(I.date,ones(size(I.date)),'--k')
hold on
h1=plot(I.date,I.PCB118./mean(I.PCB118),'o');
h1=plot(I.date,I.PCB153./mean(I.PCB153),'o');
h1=plot(I.date,I.PCB138./mean(I.PCB138),'o');
