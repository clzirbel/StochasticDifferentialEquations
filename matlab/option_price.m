% option_price.m displays the price of an option as a function of the
% strike price and remaining time until expiration

r     = log(1.04)/365;       % bond growth rate
mu    = log(1.05)/365;       % stock price growth rate
sigma = 0.01;                % stock price volatility
init  = 100;                 % initial stock price
c     = 95;                  % example strike price

[p,t] = meshgrid(60:1:120,0.05:3:180);     % prepare points on a grid
u     = wealth(p,t,c,r,sigma);

clf                          % clear the current figure

subplot(2,2,1);
mesh(t,p,u);
shading faceted;
xlabel('Time remaining');
ylabel('Stock price');
zlabel('Option price');
title(['Option price function u for strike price c = ' int2str(c)]);
axis([0 180 60 120 0 25]);
grid on;

T = [10 90 180];               % various expiration dates
C = 80:0.5:120;                % various strike prices
p = init;                      % one initial price

for i=1:3,
  subplot(2,2,i+1);
  t = T(i);
  u = wealth(p,t,C,r,sigma);
  plot(C,u);
  hold on;

  u = wealth(p,t,c,r,sigma);
  plot(c,u,'*','markersize',5);

  grid on; 
  title(['Option price with T = ' int2str(t) '.  Initial price = 100.']);
  xlabel('Strike price c');
  ylabel('Option price');
end