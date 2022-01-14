% wiener(N) simulates a one-dimensional Wiener process on [0,1] using
% normally distributed steps

function [W] = wiener(N)

if nargin == 0                      % if no number of steps is given
  N = 100000;
end

figure(1)                           % open a figure window for plotting
clf;                                % clear the entire figure

h = 1/N;                            % size of time step

t = zeros(1,N);                     % place to store time values
W = zeros(1,N);                     % place to store position values

for i = 1:N                         % loop through N steps
  t(i+1) = t(i) + h;                % move to the next time point
  W(i+1) = W(i) + sqrt(h) * randn;  % add a normally-distributed number
end

plot(t,W);                          % plot the steps versus time
hold on                             % keep the previous plot
plot(t,0*t,'r:')                    % red dotted line at height 0
axis([0 1 -2 2])                    % always scale the axis the same way
title([int2str(N) '-step version of the Wiener process'])
