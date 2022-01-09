% market.m generates realizations of bond and stock prices and plots the
% density of the stock distribution over time

clf                                    % clear the current figure

r     = log(1.04)/365;       % bond growth rate
mu    = log(1.05)/365;       % stock price growth rate
sigma = 0.01;                % stock price volatility
beta  = (mu-(sigma^2)/2);  
init  = 100;                 % initial stock and bond price

subplot(2,2,2);
  N=5000;             % number of steps to take
  T=180;              % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]

  x=zeros(size(t));   % place to store locations
  x(1)=init;          % initial location

  for j=1:10
    for i=1:N           % start taking steps
      x(i+1)=x(i)+mu*x(i)*h+sigma*x(i)*sqrt(h)*randn;
    end;
    plot(t,x);
    hold on;
  end;
  title('Realizations of stock price');
  xlabel('Time in days');
  ax = axis;
  axis([0 180 ax(3) ax(4)]);
  grid on;

subplot(2,2,1);
t=1:1:180;
x=100*exp(r*t);
plot(t,x);
axis([0 180 ax(3) ax(4)]);
title('Bond price');
xlabel('Time in days');
grid on;

subplot(2,2,3);
[x,t] = meshgrid(30:5:150,10:3:180);     % prepare points on a grid
a = (log(x/init)-beta*t)/sigma;
z = normpdf(a,0,sqrt(t)) ./ (sigma*x);
mesh(t,x,z);
shading faceted;
%colormap('default');
colormap(gray);
xlabel('Time in days');
ylabel('Price');
title('Density of stock price');
axis([0 180 30 150 0 0.14])
grid off;

subplot(2,2,4);
[x,t] = meshgrid(0.05:5:150,10:3:180);     % prepare points on a grid
a = (log(x/init)-beta*t)/sigma;
z = normpdf(a,0,sqrt(t)) ./ (sigma*x);
pcolor(t,x,-z);
%colormap(gray);
shading interp;  % slow!
%shading flat;
xlabel('Time in days');
ylabel('Price');
title('Density of stock price');



i=(0:0.01:1)';
mymap = (i.^3)*[1 1 1];
%colormap(mymap);
%colormap('default');
