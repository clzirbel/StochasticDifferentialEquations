% ode_animate.m animates several solutions to the exponential decay equation

figure(1)
clf

% program lines go here -------------------------------------------------

N=1000;             % number of steps to take
T=7;                % maximum time
h=T/N;              % time step
t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
y=zeros(size(t));   % prepare place to store locations
axis([0 T -3 8]);   % set axis limits
grid on
title('Exponential decay to 0');

initial_heights = [2 6 -2];

for yo = initial_heights

    y(1)=yo;             % initial height
    for i=1:N            % start taking steps
      y(i+1)=y(i)-y(i)*h;
    end;

    L = animatedline;
    for k = 1:length(t)
        addpoints(L,t(k),y(k));
        drawnow
    end
end
