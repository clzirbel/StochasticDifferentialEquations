% pp_flow_field.m shows the two-dimensional flow field for a simple predator prey model 

clf                                    % clear the current figure

h = 0.1;
[x,y] = meshgrid(0:0.1:4,0:0.1:4);     % prepare points on a grid
px = (x .* y - x)*h;                   % rate of growth of predator population
py = (y - x .* y)*h;                   % rate of growth of prey population
quiver(x,y,px,py,2)                    % plot the flow field
grid on
title('Predator-prey flow field');
xlabel('Predator population');
ylabel('Prey population');
