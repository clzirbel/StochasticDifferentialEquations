% add_noise.m shows the effect of adding noise to exponential decay in different ways

for j=1:4,

  clf;                % clear the figure
  T=8;                % maximum time
  N=T*10^j;           % number of steps to take
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  sigma = 1.0;        % strength of the noise
  X=zeros(size(t));   % prepare place to store locations

  fprintf('Time step %10.8f, %10d steps total \n', h, N);

  subplot(3,1,1);
  X(1)=2;             % initial height
  for i=1:N           % take N steps
    X(i+1)=X(i)-X(i)*h;
  end;
  plot(t,X)
  axis([0 T -X(1)/2 X(1)]);
  title('No noise')

  subplot(3,1,2);
  X(1)=2;             % initial height
  for i=1:N           % take N steps
    X(i+1)=X(i)-X(i)*h+sigma*h*randn;
  end;
  plot(t,X)
  axis([0 T -X(1)/2 X(1)]);
  title('Add noise using \sigma h Z')

  subplot(3,1,3);
  X(1)=2;             % initial height
  for i=1:N           % take N steps
    X(i+1)=X(i)-X(i)*h+sigma*sqrt(h)*randn;
  end;
  plot(t,X)
  axis([0 T -X(1)/2 X(1)]);
  title('Add noise using \sigma h^{1/2} Z')

  fprintf('Hit any key to continue \n');
  pause

end