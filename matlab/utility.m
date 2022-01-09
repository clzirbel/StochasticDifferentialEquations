% utility.m shows the expected utility that results from holding a constant
% fraction of your wealth in a stock, as described in Section 24.
% Then you can decide what fraction you want to put in the stock.

T     = 365;
mu    = log(1.05)/365;
r     = log(1.04)/365;
sigma = 0.01;
Delta = [0.3 0.6 1];

p = 0:0.01:1;
x = p*2;

L = length(Delta);

clf

for i=1:L,
  delta = Delta(i);

  subplot(3,2,i*2-1)

  plot(x,x.^delta);
  title(['Utility function, \delta = ' num2str(delta)]);
  axis([0 2 0 2]);

  subplot(3,2,i*2)

  eu = exp(T*(-(p.^2)*(sigma^2)*(1-delta)/2 + p*(mu-r) + r));

  plot(p,eu)
  hold on
  pm = min(1,(mu-r)/((sigma^2)*(1-delta)));
  plot(pm, exp(T*(-(pm^2)*(sigma^2)*(1-delta)/2 + pm*(mu-r) + r)),'*');
  xlabel('Fraction p of wealth put into the stock')
  ylabel('Expected utility to 1/\delta power, T=365 days')
  title('How expected utility depends on strategy')
  axis([0 1 1.03 1.05])

  

end