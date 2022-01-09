% two_gambles.m displays the distribution of gain/loss under two
% gambles, the first using $100 to buy and hold a stock, the second using
% $100 to buy options to purchase the stock at a particular price

r     = log(1.04)/365;         % bond growth rate
mu    = log(1.05)/365;         % stock price growth rate
sigma = 0.01;                  % stock price volatility
init  = 100;                   % initial stock and bond price
c     = 95;                    % exercise/strike price
t     = 180;                   % expiration date

p = wealth(init,t,c,r,sigma)   % price of option

x = 1:0.05:200;                % possible values of stock price at time t
a = (log(x/init)-beta*t)/sigma;
z = normpdf(a,0,sqrt(t)) ./ (sigma*x);
beta  = (mu-(sigma^2)/2);  

clf;

subplot(2,1,1);
xs = x-100;
plot(xs,z);
grid on;
title('Density of gain/loss from holding $100 of stock');
xlabel('Gain/Loss');
eg=100*exp(beta*t)*exp(0.5*(sigma^2)*t)-100;      % expected gain
x*z'*0.05-100;                                    % gain computed differently
sqrt(((x-100-eg).^2)*z'*0.05)                        % gain standard deviation
text(150,0.023,'Expected gain      =  2.4353');
text(150,0.021,'Standard deviation = 13.8051');
ax=axis;
ax(1:2)=[-200 500];
axis(ax);

subplot(2,1,2);
no = 100/9.2744;                        % number of options
b = normcdf((log(c/init)-beta*t)/sigma,0,sqrt(t));
                                        % prob. final price less than c
xs = (-p):0.05:(100);
x  = xs+c+p;
a  = (log(x/init)-beta*t)/sigma;
z  = (1/no) * normpdf(a,0,sqrt(t)) ./ (sigma*x);
xs = xs*no;                             % stretch out gain/loss 
p  = p*no;
plot(xs,z);
hold on;
plot([-p,-p],[0,z(1)],':');
ax(3:4) = ax(3:4) / (100/9.2744);
axis(ax);
plot(-p,0,'.','markersize',20);
grid on;
title('Density of gain/loss from $100 worth of options');
xlabel('Gain/Loss');
text(-150,0.003/no,'Probability 0.3105 of -100');
egg=(0.3105*(-9.2744)+xs*z'*0.05)*no
text(150,0.023/no,'Expected gain      =   5.6712');
text(150,0.021/no,'Standard deviation = 106.5320');
sqrt(((0.3105*(-9.2744-egg)^2+((xs-egg).^2)*z'*0.05))*no)
