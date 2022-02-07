% scaled2dwalk(N) scales two N-step random walks into time [0,1] and plots
% them as a two-dimensional trajectory
% Running it as scaled2dwalk(N); suppresses the output.

function [S,T] = scaled2dwalk(N)

figure(1)
clf

S = [0; cumsum(sign(randn(N,1)))];  % horizontal locations
T = [0; cumsum(sign(randn(N,1)))];  % vertical locations

plot(S/sqrt(N),T/sqrt(N));    % plot the path
axis([-2 2 -2 2]);

axis square
title(['Two-dimensional ' int2str(N) '-step random walk']);
