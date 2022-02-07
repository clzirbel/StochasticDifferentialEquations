% wiener(N) simulates a one-dimensional Wiener process on [0,1] using
% normally distributed steps.
% Run as wiener(1000); with semicolon to suppress the output.

function [W] = wiener(N)

figure(1)                           % open a figure window for plotting
clf;                                % clear the entire figure

if nargin == 0                      % if no number of steps is given
  N = 100000;                       % number of steps to take
end

h = 1/N;                            % size of time step

t = zeros(1,N+1);                   % place to store time values
W = zeros(1,N+1);                   % place to store position values

t(1) = 0;                           % initial time
W(1) = 0;                           % initial location
for i = 1:N                         % loop through N steps
  t(i+1) = t(i) + h;                % move to the next time point
  W(i+1) = W(i) + randn * sqrt(h);  % add a normally-distributed number
end

plot(t,W);                          % plot the steps versus time
axis([0 1 -2 2])                    % always scale the axis the same way
hold on                             % keep the previous plot
plot(t,0*t,'r:')                    % red dotted line at height 0
title([int2str(N) '-step version of the Wiener process'])
