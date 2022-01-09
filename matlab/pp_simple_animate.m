% pp_simple_animate.m animates a simple predator-prey model with noise

% things to set up the axes, make animation smooth
    cla;                                     % clear axis
    axHndl=gca;                              % gca is handle to current axis
    set(axHndl, ...
        'Drawmode','fast', ...
        'Visible','on', ...
        'NextPlot','add');
    grid on                                  % add a grid to axes

    drawprey = line( ...                     % how to draw prey
        'color','y', ...
        'linestyle','-', ...
        'erase','none', ...
        'xdata',[],'ydata',[]);

    drawpred = line( ...                     % how to draw wolves
        'color','r', ...
        'linestyle','-', ...
        'erase','none', ...
        'xdata',[],'ydata',[]);
 
% program lines go here -------------------------------------------------

  N=10000;             % number of steps to take
  T=70;                % maximum time
  h=T/N;               % time step
  t=(0:h:T);           % t is the vector [0 1h 2h 3h ... Nh]
  axis([0 6 0 6]);     % set axis limits

  x=zeros(size(t));   % place to store pred population size
  y=zeros(size(t));   % place to store prey population size

  x(1)=0.2;           % initial prey population
  y(1)=0.5;           % initial pred population

  sigma=0.05;          % strength of noise

  for i=1:N           % start taking steps
    x(i+1)=x(i)+(x(i)-x(i)*y(i))*h + sigma*x(i)*randn*sqrt(h);
    y(i+1)=y(i)+(x(i)*y(i)-y(i))*h + sigma*y(i)*randn*sqrt(h);
    set(drawprey,'xdata',[x(i),x(i+1)],'ydata',[y(i),y(i+1)]);
    drawnow;
  end;

%  plot(t,y,'y');      % plot more permanently, in yellow
%  plot(t,x,'r--');

  title('Predators and prey');
