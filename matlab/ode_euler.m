% ode_euler.m uses the Euler method to solve an ODE numerically

T = 7;                     % maximum time to go to
h = 0.01;                  % time step
N = ceil(T/h);             % number of steps to take

t = zeros(N,1);            % prepare a place to store times
z = zeros(N,1);            % prepare a place to store locations

initial_states = [1 2 4 -3 -5 0];

figure(1)
clf
plot(t,0*t,'r:')                    % red dotted line at height 0
hold on

for yo = initial_states

    t(1) = 0;                  % initial time
    z(1) = yo;                 % initial location
    for i=1:N                  % take N steps
      t(i+1) = t(i) + h;
      z(i+1) = z(i) + (-z(i))*h;  % the function f is f(z) = -z
    end;

    plot(t,z,'b');
end

axis([0 T (min(initial_states)-1) (max(initial_states)+1)]);  % set axis limits
title('Exponential decay to 0');
