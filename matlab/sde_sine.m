% sde_sine.m generates outcomes of solutions of the ODE dx/dt=sin(x(t)) with noise

  T=700;              % maximum time, which is long compared to other simulations
  N=7000000;          % number of steps to take
  h=T/N;              % time step
  sigma=1.0;          % strength of noise

  t=zeros(1,N+1);     % place to store time points
  X=zeros(1,N+1);     % place to store locations
  X(1)=0.0;           % initial location

  for i=1:N           % take N steps
    t(i+1)=t(i)+h;
    X(i+1)=X(i)+sin(X(i))*h+sigma*randn*sqrt(h);
  end;

  figure(1)
  clf;
  plot(t,X);
  title('SDE with sine drift');
