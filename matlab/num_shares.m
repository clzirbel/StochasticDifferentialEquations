% num_shares(p,t,c,r,sigma) returns the number of shares of stock held in a portfolio being managed to match the value of an option with strike price c when the current stock price is p and the time remaining is t.  The stock volatility is sigma and the risk-free interest rate is r.

function n = num_shares(p,t,c,r,sigma)

v = (log(p/c)+(r+(sigma^2)/2)*t) ./ (sigma*sqrt(t));
w = v - sigma*sqrt(t);
n = normcdf(v)+(normpdf(v)-c*exp(-r*t)*normpdf(w)/p)/(sigma*sqrt(t));
