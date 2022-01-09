% brownian_2d_animate.m shows an animation of two-dimensional Brownian motion

% things to set up the axes, make animation smooth
    clf;                                     % clear the figure
    cla;                                     % clear axis
    axHndl=gca;                              % gca is handle to current axis
    set(axHndl, ...
        'Drawmode','fast', ...
        'Visible','on', ...
        'NextPlot','add');

    drawline = line( ...                     % how to draw trajectory
        'color','y', ...
        'linestyle','-', ...
        'erase','none', ...
        'xdata',[],'ydata',[]);

    drawdot = line( ...                     % how to draw trajectory
        'color','y', ...
        'linestyle','.', ...
        'markersize',15, ...
        'erase','xor', ...
        'xdata',[],'ydata',[]);

 
% program lines go here -------------------------------------------------


  N=1000;             % number of steps to take
  T=70;                % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  axis([-sqrt(T) sqrt(T) -sqrt(T) sqrt(T)]);   % set axis limits
  sigma = 1.0;        % strength of noise

  x=zeros(size(t));   % place to store x locations
  y=zeros(size(t));   % place to store y locations

  x(1)=0.0;           % initial x location
  y(1)=0.0;           % initial y location

  for i=1:N           % take N steps
    x(i+1)=x(i)+sigma*sqrt(h)*randn;
    y(i+1)=y(i)+sigma*sqrt(h)*randn;
    set(drawdot,'xdata',[x(i),x(i+1)],'ydata',[y(i),y(i+1)]); 
                      % try drawline, drawdot for different effects
    drawnow;
  end;


  clf;
  plot(x,y);          % rescale axes and plot entire trajectory
  grid on;