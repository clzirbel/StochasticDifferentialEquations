% brownian_2d.m simulates a two-dimensional Brownian motion

  N=10000;            % number of steps to take
  T=70;               % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  sigma = 1.0;        % strength of noise

  x=zeros(size(t));   % place to store x locations
  y=zeros(size(t));   % place to store y locations

  x(1)=0.0;           % initial x location
  y(1)=0.0;           % initial y location
  for i=1:N           % take N steps
    x(i+1)=x(i)+sigma*sqrt(h)*randn;
    y(i+1)=y(i)+sigma*sqrt(h)*randn;
  end;

  plot(x,y);
  grid on             % add a grid to axes
%  axis([0 T -3 8]);   % set axis limits
