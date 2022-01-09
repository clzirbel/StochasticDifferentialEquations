% ode.m shows solutions and flow field for y' = -y (exponential decay) 
% and for y' = y - y^2 (logistic model)

clf                       % clear the current figure

% Exponential decay example

subplot(2,2,1);           % plot 2 of a 2 by 3 array of plots
t=[0:0.1:4];              % vector of time points
y=exp(-t);                % vector of positions
axis([0 4 -5 4]);
plot(t,y), hold on        % plot this trajectory, stay on this plot
y=2*exp(-t);
plot(t,y), hold on
y=4*exp(-t);
plot(t,y), hold on
y=-3*exp(-t);
plot(t,y), hold on
y=-5*exp(-t);
plot(t,y), hold on
grid on
title('Trajectories');
xlabel('time');

subplot(2,2,2);
[t,y] = meshgrid(0.2:0.4:4,-5:0.4:4);  % prepare points on a grid
pt = t .* 0 + 0.1;                     % t coordinate of vector at each point
py = -0.1 .* y;                        % y coordinate of vector at each point
quiver(t,y,pt,py)                      % plot the flow field
title('Flow field');
xlabel('time');

% Logistic model example

subplot(2,2,3);
t=[0:0.1:6];
a=0.1;
y=a*exp(t)./(1-a+a*exp(t));            % solution is more complicated here
plot(t,y),hold on
a=0.5;
y=a*exp(t)./(1-a+a*exp(t));
plot(t,y), hold on
a=1.1;
y=a*exp(t)./(1-a+a*exp(t));
plot(t,y), hold on
a=1.8;
y=a*exp(t)./(1-a+a*exp(t));
plot(t,y), hold on
a=0;
y=a*exp(t)./(1-a+a*exp(t));
plot(t,y), hold on
t=[0:0.05:1.3];
a=-0.1;
y=a*exp(t)./(1-a+a*exp(t));
plot(t,y),hold on
axis([0 6 -0.5 2]);
grid on
title('Trajectories');
xlabel('time');

subplot(2,2,4);
[t,y] = meshgrid(0.0:0.4:5.6,-0.4:0.1:2);
pt = t .* 0 + 0.1;
py = 0.1 .* (y-y.^2);
quiver(t,y,pt,py,2), hold off
title('Flow field');
xlabel('time');

% to print, first type orient landscape, to have it print sideways
% then print in the usual way.  I haven't tested this!
