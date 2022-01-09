% sde_sine.m generates outcomes of solutions of the SDE dx(t)=sin(x(t))+dB(t)

  N=10000;            % number of steps to take
  T=700;              % maximum time
  h=T/N;              % time step
  t=(0:h:T);          % t is the vector [0 1h 2h 3h ... Nh]
  sigma=1.0;          % strength of noise

  X=zeros(size(t));   % place to store locations
  X(1)=0.0;           % initial location

  for i=1:N           % take N steps
    X(i+1)=X(i)+sin(X(i))*h+sigma*sqrt(h)*randn;
  end;

  clf;
  plot(t,X);
  title('SDE with sine drift');
