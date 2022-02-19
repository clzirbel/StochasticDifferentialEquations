% scaled_general_walks.m shows rescaled walks with varying numbers of steps
% The walks need not be symmetric +1/-1 walks

figure(1)
clf;                          % clear the figure

M = [50 1000 100 5000 200 25000]; % number of steps to take in the six windows

N = max(M);                     % the largest number of steps  
t = (0:1:N)';                   % t is the column vector [0 1 2 3 ... N]

v = 4;

switch v
  case 1
    S = [0; cumsum(randn(N,1))];           % normal variables
    xlabeltext = 'Standard normal steps';
  case 2
    S = [0; cumsum(-log(rand(N,1))-1)];    % exponential variables minus their mean
    xlabeltext = 'Exponentially distributed steps';
  case 3
    S = [0; cumsum(sign(randn(N,1)))]; % +/-1 variables
    xlabeltext = '+1/-1 steps';
  case 4
    k = 10;
    S = [0; cumsum((k+1)*(rand(N,1)>k/(k+1))-1)]/sqrt(k);
    xlabeltext = sprintf("+%d/-1 steps",k)
end

for i=1:6,
  subplot(3,2,i)

  N = M(i);
  t = (0:N)';

  plot(t/N,S(1:N+1)/sqrt(N));            % plot steps of the path
  axis([0 1 -2 2]);
  title(['First ' int2str(N) ' steps'])
end

xlabel(xlabeltext)
