% blackscholes generates bond and stock prices and simulates the Black-Scholes
% portfolio that is equivalent to holding an option to buy the stock

r     = log(1.04)/365;         % bond growth rate
mu    = log(1.05)/365;         % stock price growth rate
sigma = 0.01;                  % stock price volatility
init  = 100;                   % initial stock and bond price
c     = 95;                    % exercise/strike price

N=500;              % number of steps to take
T=180;              % maximum time
h=T/N;              % time step
t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]

clf

for k=1:4,

subplot(2,2,k)

b=zeros(size(t));   % bond prices
p=zeros(size(t));   % stock prices
m=zeros(size(t));   % number of shares of bond
n=zeros(size(t));   % number of shares of stock
x=zeros(size(t));   % wealth process computed from option price function u
y=zeros(size(t));   % wealth process computed from SDE

% Initial values
  b(1)=init;          % initial bond price
  p(1)=init;          % initial stock price
    s = T;                                     % time argument
    v = (log(p(1)/c)+(r+(sigma^2)/2)*s) ./ (sigma*sqrt(s));
    w = v - sigma*sqrt(s);
  x(1) = p(1) .* normcdf(v) - c*exp(-r*s) .* normcdf(w);  % price of option
  y(1) = x(1);
  n(1) = normcdf(v)+(normpdf(v)-c*exp(-r*s)*normpdf(w)/p(1))/(sigma*sqrt(s));
                                          % shares of stock
  m(1) = (x(1)-n(1)*p(1))/b(1);           % shares of bond

  for i=1:N           % start taking steps
    b(i+1)=b(i)+r*b(i);                               % bond price
    p(i+1)=p(i)+mu*p(i)*h+sigma*p(i)*sqrt(h)*randn;   % stock price
    y(i+1) = y(i) + n(i)*(p(i+1)-p(i)) + m(i)*(b(i+1)-b(i));  % wealth
      s = T-t(i+1);                                     % time argument
      v = (log(p(i+1)/c)+(r+(sigma^2)/2)*s) ./ (sigma*sqrt(s));
      w = v - sigma*sqrt(s);
    x(i+1) = p(i+1) .* normcdf(v) - c*exp(-r*s) .* normcdf(w);
    n(i+1) = normcdf(v) + (normpdf(v)-c*exp(-r*s)*normpdf(w)/p(i+1))/(sigma*sqrt(s));                                                % shares of stock
    m(i+1) = (x(i+1)-n(i+1)*p(i+1))/b(i+1);           % shares of bond
  end;

[xx,tt] = meshgrid(60:1:120,0.05:3:180);     % prepare points on a grid

gg = (log(xx/c)+(r+(sigma^2)/2)*tt) ./ (sigma*sqrt(tt));
uu = xx .* normcdf(gg) - c*exp(-r*tt) .* normcdf(gg - sigma*sqrt(tt));

mesh(tt,xx,uu);
shading faceted;
xlabel('Time remaining');
ylabel('Stock price');
zlabel('Wealth');
title('Function u graphed with wealth of Black-Scholes portfolio');
axis([0 180 60 120 0 25]);
grid on;
hold on;

g = (log(p/c)+(r+(sigma^2)/2)*t) ./ (sigma*sqrt(t));
u = p .* normcdf(g) - c*exp(-r*t) .* normcdf(g - sigma*sqrt(t));

plot3(T-t, p, x+0.1);

end