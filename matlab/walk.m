% walk(N) displays outcomes of the N-step random walk
% Run it by typing walk(10) or walk(50) at the command line
% Type walk(50); to suppress the listing of positions
function [S] = walk(N)              % N is the output, S is the output

if nargin < 1                       % If no arguments were given,
    N = 50;                         % Plot a 50-step walk
end

t = zeros(1,N+1);                   % row vector to store times
S = zeros(1,N+1);                   % row vector to store positions

for n = 1:N
    t(n+1) = t(n) + 1;              % increment time by 1
    S(n+1) = S(n) + 2*(rand>0.5)-1; % position goes up or down by 1
end

M = max(abs(S))+1;                  % maximum distance from 0, plus 1

figure(1)
clf;                                % clear the entire figure

if N <= 50
    plot(t,S,'b.');                 % plot the path with blue dots
    hold on
end

plot(t,S,'b');                      % plot the path with blue lines
axis([0 N -M M])                    % set the axis limits
title([int2str(N) '-step random walk']) % graph title
