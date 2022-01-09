% pp_logistic_noise.m shows the effect of noise on a logistic predator prey model

subplot(2,2,1);
  N=10000;             % number of steps to take
  T=70;                % maximum time
  h=T/N;               % time step
  t=(0:h:T);           % t is the vector [0 1h 2h 3h ... Nh]

  x=zeros(size(t));   % place to store pred population size
  y=zeros(size(t));   % place to store prey population size

  x(1)=0.2;           % initial prey population
  y(1)=0.5;           % initial pred population

  sigma=0.0;          % strength of noise

  for i=1:N           % start taking steps
    x(i+1)=x(i)+(x(i)*(5-x(i))-x(i)*y(i))*h + sigma*x(i)*randn*sqrt(h);
    y(i+1)=y(i)+(x(i)*y(i)-y(i))*h + sigma*y(i)*randn*sqrt(h);
  end;

  plot(x,y);
  axis([0 5 0 7]);     % set axis limits
  grid on;
  title('No noise');
  xlabel('Prey population');
  ylabel('Predator population');

subplot(2,2,2);
  N=10000;             % number of steps to take
  T=70;                % maximum time
  h=T/N;               % time step
  t=(0:h:T);           % t is the vector [0 1h 2h 3h ... Nh]

  x=zeros(size(t));   % place to store pred population size
  y=zeros(size(t));   % place to store prey population size

  x(1)=0.2;           % initial prey population
  y(1)=0.5;           % initial pred population

  sigma=0.1;          % strength of noise

  for i=1:N           % start taking steps
    x(i+1)=x(i)+(x(i)*(5-x(i))-x(i)*y(i))*h + sigma*x(i)*randn*sqrt(h);
    y(i+1)=y(i)+(x(i)*y(i)-y(i))*h + sigma*y(i)*randn*sqrt(h);
  end;

  plot(x,y);
  axis([0 5 0 7]);     % set axis limits
  grid on;
  title('sigma = 0.1');

subplot(2,2,3);
  N=10000;             % number of steps to take
  T=70;                % maximum time
  h=T/N;               % time step
  t=(0:h:T);           % t is the vector [0 1h 2h 3h ... Nh]

  x=zeros(size(t));   % place to store pred population size
  y=zeros(size(t));   % place to store prey population size

  x(1)=0.2;           % initial prey population
  y(1)=0.5;           % initial pred population

  sigma=0.3;          % strength of noise

  for i=1:N           % start taking steps
    x(i+1)=x(i)+(x(i)*(5-x(i))-x(i)*y(i))*h + sigma*x(i)*randn*sqrt(h);
    y(i+1)=y(i)+(x(i)*y(i)-y(i))*h + sigma*y(i)*randn*sqrt(h);
  end;

  plot(x,y);
  axis([0 5 0 7]);     % set axis limits
  grid on;
  title('sigma = 0.3');

subplot(2,2,4);
  N=10000;             % number of steps to take
  T=70;                % maximum time
  h=T/N;               % time step
  t=(0:h:T);           % t is the vector [0 1h 2h 3h ... Nh]

  x=zeros(size(t));   % place to store pred population size
  y=zeros(size(t));   % place to store prey population size

  x(1)=0.2;           % initial prey population
  y(1)=0.5;           % initial pred population

  sigma=0.3;          % strength of noise

  for i=1:N           % start taking steps
    x(i+1)=x(i)+(x(i)*(5-x(i))-x(i)*y(i))*h + sigma*x(i)*randn*sqrt(h);
    y(i+1)=y(i)+(x(i)*y(i)-y(i))*h + sigma*y(i)*randn*sqrt(h);
  end;

  plot(x,y);
  axis([0 5 0 7]);     % set axis limits
  grid on;
  title('sigma = 0.3');
