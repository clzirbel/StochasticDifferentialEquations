% portfolio.m generates bond and stock prices and uses the Black-Scholes
% portfolio that is equivalent to holding an option to buy the stock

r     = 0.000107454;         % bond growth rate
mu    = 0.000133671;         % stock price growth rate
sigma = 0.01;                % stock price volatility
init  = 100;                 % initial stock and bond price
c     = 95;                  % strike price
N     = 500;                 % number of steps to take
T     = 180;                 % maximum time

h = T/N;              % time step
t = (0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]

b = zeros(size(t));   % bond prices
p = zeros(size(t));   % stock prices
m = zeros(size(t));   % number of shares of bond
n = zeros(size(t));   % number of shares of stock
x = zeros(size(t));   % wealth process computed from option price function u
y = zeros(size(t));   % wealth process computed from SDE

% Initial values

  b(1) = init;                            % initial bond price
  p(1) = init;                            % initial stock price
  x(1) = wealth(p(1),T,c,r,sigma);
  y(1) = x(1);
  n(1) = num_shares(p(1),T,c,r,sigma);    % shares of stock
  m(1) = (x(1)-n(1)*p(1))/b(1);           % shares of bond

  for i=1:N                                           % take N steps
    b(i+1) = b(i)+r*b(i)*h;                           % bond price
    p(i+1) = p(i)+mu*p(i)*h+sigma*p(i)*sqrt(h)*randn; % stock price
    x(i+1) = wealth(p(i+1),T-t(i+1),c,r,sigma);       % wealth from u
    y(i+1) = y(i) + n(i)*(p(i+1)-p(i)) + m(i)*(b(i+1)-b(i));  % wealth
    n(i+1) = num_shares(p(i+1),T-t(i+1),c,r,sigma);   % shares of stock
    m(i+1) = (x(i+1)-n(i+1)*p(i+1))/b(i+1);           % shares of bond
  end;

clf

subplot(2,2,1);
  plot(t,p);
  hold on;
  plot(t,b);
  title('Stock and bond prices');
  xlabel('time in days');
  ax = axis;
  grid on;

subplot(2,2,2);
  plot(t,n);
  title('Number of shares of stock');
  grid on;

subplot(2,2,3);
  plot(t,x);
  title('Wealth process X'); 
  grid on;

subplot(2,2,4);
  plot(t,m);
  title('Number of shares of bond');
  grid on;
