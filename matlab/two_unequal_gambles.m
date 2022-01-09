% two_gambles.m displays the distribution of gain/loss under two gambles,
% the first being buying and holding a stock, the second being buying an
% option to purchase the stock at a particular price

r     = 0.000107454;         % bond growth rate
mu    = 0.000133671;         % stock price growth rate
sigma = 0.01;                % stock price volatility
beta  = (mu-(sigma^2)/2);  
init  = 100;                 % initial stock and bond price
c = 95;                      % exercise/strike price
p = 9.2744;                  % price of option

t = 180;                     % expiration date
x = 1:0.05:200;
a = (log(x/init)-beta*t)/sigma;
z = normpdf(a,0,sqrt(t)) ./ (sigma*x);

clf;

subplot(2,2,1);
plot(x,z);
grid on;
title('Density of stock price at time T=180');
xlabel('Final stock price P');

subplot(2,2,2);
xs = x-100;
plot(xs,z);
grid on;
title('Density of Gain/Loss from holding');
xlabel('Gain/Loss');
100*exp(beta*t)*exp(0.5*(sigma^2)*t)-100;              % expected gain
x*z'*0.05-100
text(-90,0.022,'Expected gain = 2.4353');

ax=axis;

subplot(2,2,3);
g = max(0,x-c)-p;
plot(x,g);
grid on;
title('Gain/Loss on option');
xlabel('Final stock price P');
ylabel('Gain = max(0,P-c) - 9.2744');
text(55,45,'Strike price c=95');
text(55,35,'Option costs 9.2744');

subplot(2,2,4);
b = normcdf((log(c/init)-beta*t)/sigma,0,sqrt(t));
                             % prob. final price less than c
xs = (-p):0.05:(100);
x = xs+c+p;
a = (log(x/init)-beta*t)/sigma;
z = normpdf(a,0,sqrt(t)) ./ (sigma*x);
plot(xs,z);
hold on;
plot([-p,-p],[0,z(1)],':');
axis(ax);
plot(-p,0,'.','markersize',20);
grid on;
title('Density of gain/loss from option');
xlabel('Gain/Loss');
text(-55,0.003,'Probability 0.3105 of -9.2744');
0.3105*(-9.2744)+xs*z'*0.05
text(-90,0.022,'Expected gain = 0.5260');
