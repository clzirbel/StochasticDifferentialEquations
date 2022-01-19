% ode.m shows solutions and flow field for y' = -y (exponential decay) 
% and for y' = y - y^2 (logistic model)

figure(1)
clf                       % clear the current figure

% Exponential decay example

subplot(2,2,1);           % plot 2 of a 2 by 3 array of plots
t=[0:0.1:4];              % vector of time points
axis([0 4 -5 4]);

initial_values = [1 2 4 -3 -5 0];

for a = initial_values
    y=a*exp(-t);
    plot(t,y)
    hold on
end
grid on
title('Exponential decay');
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

initial_values = [0.1 0.5 1.1 1.8 0];

for a = initial_values
    y=a*exp(t)./(1-a+a*exp(t));            % solution is more complicated here
    plot(t,y)
    hold on
end

% special treatment because solutions fail for starting point < 0
a = -0.1;
y=a*exp(t)./(1-a+a*exp(t));            % solution is more complicated here
plot(t(y<0),y(y < 0))

axis([0 6 -0.5 2]);
grid on
title('Logistic growth or decay');
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
