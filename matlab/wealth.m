% wealth(p,t,c,r,sigma) returns the wealth of a portfolio being managed to match the value of an option with strike price c when the current stock price is p and the time remaining is t.  The stock volatility is sigma and the risk-free interest rate is r.

function u = wealth(p,t,c,r,sigma)

g = (log(p)-log(c)+(r+(sigma^2)/2)*t) ./ (sigma*sqrt(t));
u = p .* normcdf(g) - c.*exp(-r*t) .* normcdf(g - sigma*sqrt(t));
