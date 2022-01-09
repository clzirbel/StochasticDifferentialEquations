% scaled_general_walks.m shows rescaled walks with varying numbers of steps
% The walks need not be symmetric +1/-1 walks

clf;                          % clear the figure

M = [50 1000 100 5000 200 25000]; % number of steps to take in the six windows

N = max(M);                     % the largest number of steps  
t = (0:1:N)';                   % t is the column vector [0 1 2 3 ... N]


S = [0; cumsum(2*(rand(N,1)>0.5)-1)]; % +/-1 variables
S = [0; cumsum(-log(rand(N,1))-1)];    % exponential variables
S = [0; cumsum(randn(N,1))];           % normal variables
n = 10;
S = [0; cumsum((n+1)*(rand(N,1)>n/(n+1))-1)]/sqrt(n);
                                       % -1/n valued variables

for i=1:6,
  subplot(3,2,i)

  N = M(i);
  t = (0:N)';

  plot(t/N,S(1:N+1)/sqrt(N));            % plot the path
  axis([0 1 -2 2]);
  title(['First ' int2str(N) ' steps'])
end

xlabel('Normally distributed steps')
xlabel('-1 / 10 valued steps')