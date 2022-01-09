% rando(x) returns a random integer distributed according to probability vector x

function [index] = rando(x)
n = length(x);
u = rand;
i = 1;
s = x(1);

while ((u > s) & (i < n)),
  i=i+1;
  s=s+x(i);
end

index=i;
