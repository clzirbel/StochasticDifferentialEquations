% ode_animate.m animates several solutions to the exponential decay equation

figure(1)
clf

% program lines go here -------------------------------------------------

N=1000;             % number of steps to take
T=7;                % maximum time
h=T/N;              % time step
t=zeros(1,N);       % prepare a place to store times
y=zeros(1,N);       % prepare a place to store states
axis([0 T -3 8]);   % set axis limits
grid on             % show a grid on the graph

initial_states = [2 6 -2 8 -3 0]; 

for yo = initial_states          % loop over initial states

    y(1) = yo;                   % initial state
    for i = 1:N                  % take N steps, one by one
      t(i+1) = t(i) + h;         % move forward one step in time
      y(i+1) = y(i) - y(i) * h;  % exponential decay
    end

    L = animatedline;            % how Matlab does animations
    for k = 1:length(t)
        addpoints(L,t(k),y(k));  % add one more line segment
        drawnow
    end
end
