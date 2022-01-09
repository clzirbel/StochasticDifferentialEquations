% scaled3dwalk(N) scales two N-step random walks into time [0,1] and plots
% them as a two-dimensional trajectory

function [S,T] = scaled2dwalk(N)

clf

R = [0; cumsum(2*(rand(N,1)>0.5)-1)]/sqrt(N);  % horizontal locations
S = [0; cumsum(2*(rand(N,1)>0.5)-1)]/sqrt(N);  % horizontal locations
T = [0; cumsum(2*(rand(N,1)>0.5)-1)]/sqrt(N);  % vertical locations

plot3(R,S,T)

axis square
title(['Three-dimensional ' int2str(N) '-step random walk']);

rotate3d on