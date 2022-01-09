% sine_forward.m sets up Kolmogorov's forward equation for the SDE 
% dX(t) = sin(X(t))dt + sigma * dB(t) with X(0)=0.

  Tf = 6;
  Tfixed=6;
  nx = 150;                          % number of spatial grid points
  nt = 100;                          % number of time steps
  dx = 1/nx;
  dt = Tf/nt;
  x  = (0:dx:1)';
  t  = (0:dt:Tf);
  xc = (dx/2:dx:1-dx/2)';

% The spatial limits are set here
  xmin = -11*pi;                     
  xmax = 11*pi;

  p = xmax-xmin;                     % length of the interval
  xp  = xmin + p*x;                  % points along the x interval
  xcp = xmin + p*xc;                 % centered points along the x interval

% The coefficients a, b, c are set here. 

  sigma = 3;                         % diffusion coefficient
  a = (sigma^2)*ones(size(xcp))/2;   % constant diffusion coefficient
  b = -sin(xcp);                     % sinusoidal drift
  c = -cos(xcp);                     % derivative of drift for adjoint

% The initial condition is set here to be concentrated at the center
% of the interval

  u0 = zeros(size(xp));              % density of X(0)
  [junk,imid]=min(abs(x-1/2));       % find the midpoint
  u0(imid) = 1;                      % make a sharp spike in the initial cond.
                                     % sum(u0)=1 for normalization

  kolm_forward                       % solve Kolmogorov's equation

orient tall
saveas(gcf,'sine_forward.pdf','pdf');
