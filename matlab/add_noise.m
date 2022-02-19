% add_noise.m shows the effect of adding noise to exponential decay in different ways

for j=1:4,

  figure(1)           % bring up the figure 1 window
  clf;                % clear the figure
  T=8;                % maximum time
  N=T*10^j;           % number of steps to take
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  sigma = 1.0;        % strength of the noise
  t=zeros(1,N+1);     % prepare place to store locations
  X=zeros(1,N+1);     % prepare place to store locations

  fprintf('Time step %10.8f, %10d steps total\n', h, N);

  subplot(3,1,1);
  t(1)=0;
  X(1)=2;             % initial height
  for i=1:N           % take N steps
    t(i+1)=t(i)+h;
    X(i+1)=X(i)-X(i)*h;
  end;
  plot(t,X)
  axis([0 T -X(1)/2 X(1)]);
  title(sprintf('No noise, time step %0.4f', h))

  subplot(3,1,2);
  t(1)=0;
  X(1)=2;             % initial height
  for i=1:N           % take N steps
    t(i+1)=t(i)+h;
    X(i+1)=X(i)-X(i)*h+sigma*randn*h;
  end;
  plot(t,X)
  axis([0 T -X(1)/2 X(1)]);
  title('Add noise using \sigma Z h')

  subplot(3,1,3);
  t(1)=0;
  X(1)=2;             % initial height
  for i=1:N           % take N steps
    t(i+1)=t(i)+h;
    X(i+1)=X(i)-X(i)*h+sigma*randn*sqrt(h);
  end;
  plot(t,X)
  axis([0 T -X(1)/2 X(1)]);
  title('Add noise using \sigma Z \surd h')

  fprintf('Hit any key to continue \n');
  pause

end