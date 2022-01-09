% pp_animate.m animates predator and prey population sizes in simple predator prey model without noise

clf

% things to set up the axes, make animation smooth
    cla;                                     % clear axis
    axHndl=gca;                              % gca is handle to current axis
    set(axHndl, ...
        'Drawmode','fast', ...
        'Visible','on', ...
        'NextPlot','add');
    grid on                                  % add a grid to axes

    drawdeer = line( ...                     % how to draw deer
        'color','y', ...
        'linestyle','-', ...
        'erase','none', ...
        'xdata',[],'ydata',[]);

    drawwolf = line( ...                     % how to draw wolves
        'color','r', ...
        'linestyle','-', ...
        'erase','none', ...
        'xdata',[],'ydata',[]);
 
% program lines go here -------------------------------------------------

  N=10000;             % number of steps to take
  T=70;                % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  axis([0 T -3 8]);   % set axis limits

  x=zeros(size(t));   % place to store wolf population size
  y=zeros(size(t));   % place to store deer population size

  x(1)=0.2;           % initial wolf population
  y(1)=0.5;           % initial deer population

  for i=1:N           % start taking steps
    y(i+1)=y(i)+(y(i)-x(i)*y(i))*h;
    x(i+1)=x(i)+(x(i)*y(i)-x(i))*h;
    set(drawdeer,'xdata',[t(i),t(i+1)],'ydata',[y(i),y(i+1)]);
    drawnow;
    set(drawwolf,'xdata',[t(i),t(i+1)],'ydata',[x(i),x(i+1)]);
    drawnow;
  end;
  plot(t,y,'y');      % plot more permanently, in yellow
  plot(t,x,'r--');

  title('Wolves and deer');