% scaled2dwalk(N) scales two N-step random walks into time [0,1] and plots
% them as a two-dimensional trajectory

function [S,T] = scaled2dwalk(N)

S = [0; cumsum(2*(rand(N,1)>0.5)-1)];  % horizontal locations
T = [0; cumsum(2*(rand(N,1)>0.5)-1)];  % vertical locations

plot(S/sqrt(N),T/sqrt(N));    % plot the path
axis([-2 2 -2 2]);

axis square
title(['Two-dimensional ' int2str(N) '-step random walk']);
zoom on