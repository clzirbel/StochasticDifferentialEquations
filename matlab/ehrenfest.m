% ehrenfest(n,m) simulates an Ehrenfest urn with n balls for m steps
% Initially there are n white balls in the urn.
% At each step, a ball is drawn out randomly.
% If the ball drawn is white, it is replaced by a black one.
% If the ball drawn is black, it is replaced by a white one.
% The number of white balls will fluctuate around n/2.

function [X] = ehrenfest(n,m)

X(1) = n;
for j=1:m,
  X(j+1) = X(j) + 2*(rand > X(j)/n) - 1;
end

figure(1)
clf
plot(X);

figure(2)
clf
hist(X);
