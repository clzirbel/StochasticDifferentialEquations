% scaledwalk(N) displays outcomes of the N-step random walk
% scaledwalk(N); will not list the values of S

function [S] = walk(N)              % return the path S as a vector

clf;                                % clear the entire figure

t = (0:1:N)';                       % t is the column vector [0 1 2 3 ... N]

S = [0; cumsum(2*(rand(N,1)>0.5)-1)];  % S is the running sum of +/-1 variables

plot(t/N,S/sqrt(N));                % plot the path
axis([0 1 -2 2]);
title(['Scaled ' int2str(N) '-step random walk'])

S = S/sqrt(N);

