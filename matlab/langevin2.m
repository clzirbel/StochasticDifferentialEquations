% langevin.m shows outcomes of exponential decay with noise (Langevin equation)
clf;

  N=80000;             % number of steps to take
  T=80;                % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  y=zeros(size(t));   % prepare place to store locations

subplot(2,1,1);

  a = 0.3;
  s = 0.1;
  y(1)= sqrt(s/(2*a))*randn;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y), hold on  % plot more permanently

  axis([0 T -2 2]);   % set axis limits
  grid on;
  title('Ornstein-Uhlenbeck process \alpha = 0.3 and \sigma = 0.1');

subplot(2,1,2);

  a = 1;
  s = 0.5;
  y(1)=sqrt(s/(2*a))*randn;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y), hold on  % plot more permanently

  axis([0 T -2 2]);   % set axis limits
  grid on;
  title('Ornstein-Uhlenbeck process \alpha = 1 and \sigma = 0.5');

