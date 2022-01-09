% many_geometric_brownian.m displays several geometric Brownian motions
% using the same Wiener process W for each

N = 10000;
T = 2;

t = (0:1:N)'/N;                   % t is the column vector [0 1/N 2/N ... 1]
W = [0; cumsum(randn(N,1))]/sqrt(N); % S is running sum of N(0,1/N) variables

t = t*T;
W = W*sqrt(T);

R = [2 2 2 2 2 2];
Alpha = [0.1 1.5 0.5 2 1 2.5];

clf

for k=1:6,

r = R(k);
alpha = Alpha(k);

subplot(3,2,k)

Y = (r-(alpha^2)/2)*t + alpha * W;

X = exp(Y);

plot(t,X);          % plot the path
hold on
plot(t,exp(r*t),':');
axis([0 T 0 max(1,exp(r*T))])
title([int2str(N) '-step geometric Brownian motion and its mean'])
xlabel(['r = ' num2str(r) ', \alpha = ' num2str(alpha) ', r-\alpha^2/2 = ' num2str(r-(alpha^2)/2)])

end