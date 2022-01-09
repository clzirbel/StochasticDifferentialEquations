% vrando(x,n) returns an n x 1 vector of random variables distributed according to the probability vector x

function [y] = vrando(x,n)

for i=1:n,
  y(i,1) = rando(x);
end
