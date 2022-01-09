% ode_animate.m animates several solutions to the exponential decay equation

% things to set up the axes, make animation smooth
    cla;                                     % clear axis
    axHndl=gca;                              % gca is handle to current axis
    set(axHndl, ...
        'Drawmode','fast', ...
        'Visible','on', ...
        'NextPlot','add');
    grid on                                  % add a grid to axes

    body = line( ...                         % define 'body'
        'color','k', ...
        'linestyle','-', ...
        'erase','none', ...
        'xdata',[],'ydata',[]);
 
% program lines go here -------------------------------------------------

  N=1000;             % number of steps to take
  T=7;                % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  y=zeros(size(t));   % prepare place to store locations
  axis([0 T -3 8]);   % set axis limits

  y(1)=2;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h;
    set(body,'xdata',[t(i),t(i+1)],'ydata',[y(i),y(i+1)]);
    drawnow;
  end;
  plot(t,y);          % plot more permanently

  y(1)=6;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h;
    set(body,'xdata',[t(i),t(i+1)],'ydata',[y(i),y(i+1)]);
    drawnow;
  end;
  plot(t,y);          % plot more permanently

  y(1)=-2;            % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h;
    set(body,'xdata',[t(i),t(i+1)],'ydata',[y(i),y(i+1)]);
    drawnow;
  end;
  plot(t,y);          % plot more permanently

  title('Exponential decay to 0');

