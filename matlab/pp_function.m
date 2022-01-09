% pp_function(t,y) is the right hand side of dy/dt = f(y,t) for predator-prey

function [yout] = pp_function(t,y)

yout = 0.1*[(y(1)*y(2) - y(1)); (y(2)-y(1)*y(2))];
