% pp_stability.m explores stability for Euler's method in a simple predator prey model without noise

  N=1000;             % number of steps to take
  T=70;                % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  axis([0 T -3 8]);   % set axis limits

  x=zeros(size(t));   % place to store wolf population size
  y=zeros(size(t));   % place to store deer population size

  x(1)=0.2;           % initial wolf population
  y(1)=0.5;           % initial deer population

  for i=1:N           % start taking steps
    x(i+1)=x(i)+(x(i)*y(i)-x(i))*h;
    y(i+1)=y(i)+(y(i)-x(i)*y(i))*h;
  end;

subplot(2,3,1);
  plot(t,x,'r--'), hold on
  axis([0 70 0 6]);
  plot(t,y,'y');      % plot more permanently, in yellow
  title('Wolves and deer, 1000 steps');
  hold off;

subplot(2,3,4);
  cla;
  plot(x,y);
  axis([0 6 0 6]);
  title('Wolf,deer trajectory, 10,000 steps');
  xlabel('Wolf population');
  ylabel('Deer population');


subplot(2,3,3);
  h = 0.1;
  [x,y] = meshgrid(0:0.1:3.8,0:0.1:3.8);     % prepare points on a grid
  px = (x .* y - x)*h;                   % rate of growth of wolf population
  py = (y - x .* y)*h;                   % rate of growth of deer population
  quiver(x,y,px,py,2)                    % plot the flow field
  title('Flow field');
  xlabel('Wolf population');
  ylabel('Deer population');


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
    x(i+1)=x(i)+(x(i)*y(i)-x(i))*h;
    y(i+1)=y(i)+(y(i)-x(i)*y(i))*h;
  end;

subplot(2,3,2);
  plot(t,x,'r--'), hold on;
  plot(t,y,'y');      % plot more permanently, in yellow
  axis([0 70 0 4]);
  title('Wolves and deer, 10,000 steps');


subplot(2,3,5);
  plot(x,y);
  title('Wolf,deer trajectory, 10,000 steps');
  xlabel('Wolf population');
  ylabel('Deer population');


subplot(2,3,6);

  N=100000;             % number of steps to take
  T=70;                % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  axis([0 T -3 8]);   % set axis limits

  x=zeros(size(t));   % place to store wolf population size
  y=zeros(size(t));   % place to store deer population size

  x(1)=0.2;           % initial wolf population
  y(1)=0.5;           % initial deer population

  for i=1:N           % start taking steps
    x(i+1)=x(i)+(x(i)*y(i)-x(i))*h;
    y(i+1)=y(i)+(y(i)-x(i)*y(i))*h;
  end;

  cla;
  plot(x,y);
  title('Wolf,deer trajectory, 10,000 steps');
  xlabel('Wolf population');
  ylabel('Deer population');
