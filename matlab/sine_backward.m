% sine_backward.m sets up Kolmogorov's backward equation for the SDE
% dX(t) = sin(X(t))dt + sigma * dB(t) with X(0)=0.

  Tf = 6;                            % maximum time to run to
  Tfixed=6;                          % time at which to display the solution
  nx = 150;                          % number of spatial grid points
  nt = 100;                          % number of time steps

  dx = 1/nx;
  dt = Tf/nt;
  x  = (0:dx:1)';                    % x values from 0 to 1
  t  = (0:dt:Tf);
  xc = (dx/2:dx:1-dx/2)';            % centered x values between 0 and 1

% The spatial limits are set here
  xmin = -10;                     % minimum x value
  xmax = 10;                      % maximum x value

  p = xmax-xmin;                     % length of the interval
  xp  = xmin + p*x;                  % points along the x interval
  xcp = xmin + p*xc;                 % centered points along the x interval

% The coefficients a, b, c are set here. 

  sigma = 1;                         % diffusion coefficient
  a = (sigma^2)*ones(size(xcp))/2;   % constant diffusion coefficient
  b = sin(xcp);                      % sinusoidal drift
  c = zeros(size(xcp));              % linear growth term

% The initial condition is the function whose expected value you want

  u0 = abs(sin(xp));                 % second moment

  kolm_backward                      % solve Kolmogorov's backward equation