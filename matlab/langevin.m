% langevin.m shows outcomes of exponential decay with noise (Langevin equation)
clf;

  N=8000;             % number of steps to take
  T=8;                % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  y=zeros(size(t));   % prepare place to store locations

subplot(2,3,1);
  y(1)=3;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h;
  end;
  plot(t,y), hold on  % plot more permanently

  y(1)=-2;            % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h;
  end;
  plot(t,y);          % plot more permanently

  axis([0 T -2 3]);   % set axis limits
  grid on;
  title('Exponential decay to 0, 8000 steps');

subplot(2,3,2);
  s=0.1;              % \sigma

  y(1)=3;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y), hold on  % plot more permanently

  y(1)=-2;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y);          % plot more permanently

  axis([0 T -2 3]);   % set axis limits
  grid on;
  title('\sigma = 0.1, 8000 steps');

subplot(2,3,3);
  s=0.4;                % sigma

  y(1)=3;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y), hold on  % plot more permanently

  y(1)=-2;            % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y);          % plot more permanently

  axis([0 T -2 3]);   % set axis limits
  grid on;
  title('\sigma = 0.4, 8000 steps');

subplot(2,3,4);
  N=80;             % number of steps to take
  T=8;                % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  y=zeros(size(t));   % prepare place to store locations
  s=0.2;              % sigma

  y(1)=3;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y), hold on  % plot more permanently

  y(1)=-2;            % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y);          % plot more permanently

  axis([0 T -2 3]);   % set axis limits
  grid on;
  title('80 steps, h=0.1, \sigma=0.2');


subplot(2,3,5);
  N=800;             % number of steps to take
  T=8;                % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  y=zeros(size(t));   % prepare place to store locations

  y(1)=3;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y), hold on  % plot more permanently

  y(1)=-2;            % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y);          % plot more permanently

  axis([0 T -2 3]);   % set axis limits
  grid on;
  title('800 steps, h=0.01, \sigma=0.2');

subplot(2,3,6);
  N=8000;             % number of steps to take
  T=8;                % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  y=zeros(size(t));   % prepare place to store locations

  y(1)=3;             % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y), hold on  % plot more permanently

  y(1)=-2;            % initial height
  for i=1:N           % start taking steps
    y(i+1)=y(i)-y(i)*h+s*sqrt(h)*randn;
  end;
  plot(t,y);          % plot more permanently

  axis([0 T -2 3]);   % set axis limits
  grid on;
  title('8000 steps, h=0.001, \sigma=0.2');

orient landscape
saveas(gcf,'langevin.pdf','pdf');