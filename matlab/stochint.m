% stochint.m generates outcomes of stochastic integral processes

  clf;
  N     = 10000;      % number of steps to take
  T     = 1;          % maximum time
  h     = T/N;        % time step
  t     = (0:h:T);    % t is the vector [0 1h 2h 3h ... Nh]

  W=zeros(size(t));   % place to store locations of the Wiener process
  W(1)=0.0;           % initial location

  I=zeros(size(t));   % place to store values of the stochastic integral
  I(1)=0.0;           % initial value

  for i=1:N           % start taking steps
    W(i+1) = W(i) + sqrt(h)*randn;
    I(i+1) = I(i) + W(i) * (W(i+1) - W(i));
  end;

  plot(t,I);
