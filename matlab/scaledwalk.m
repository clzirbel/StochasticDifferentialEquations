% scaledwalk(N) displays outcomes of the rescaled N-step random walk
% scaledwalk(N); will not list the values of W

function [W] = scaledwalk(N)             % return the path W as a vector

figure(1)
clf;                                     % clear the entire figure

t = zeros(1,N+1);                        % vector of time points
W = zeros(1,N+1);                        % vector of values of locations
for i = 1:N                              % loop through N values of i
  t(i+1) = t(i) + 1/N;                   % move to the next time point
  W(i+1) = W(i) + sign(randn) / sqrt(N); % go up or down by 1/sqrt(N)
end
plot(t,W);                               % plot the steps connected by lines
axis([0 1 -2 2]);                        % use standard axis limits
title(['Scaled ' int2str(N) '-step random walk'])
