% brownian(N,b,sigma,T) simulates a one-dimensional Brownian motion on [0,1] 
% using normally distributed steps

function [B] = brownian(N,b,sigma,T)

clf;                                % clear the entire figure

t = (0:1:N)'/N;                     % t is the column vector [0 1/N 2/N ... 1]

W = [0; cumsum(randn(N,1))]/sqrt(N); % S is running sum of N(0,1/N) variables

t = t*T;
W = W*sqrt(T);

B = b*t + sigma*W;

plot(t,B);          % plot the path
hold on
plot(t,b*t,':');
axis([0 T min(-sigma,(b-2*sigma)*T) max(sigma,(b+2*sigma)*T)])
title([int2str(N) '-step version of Brownian motion and its mean'])
xlabel(['Drift ' num2str(b) ', diffusion coefficient ' num2str(sigma)])
hold off
