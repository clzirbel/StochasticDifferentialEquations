% kolm_sine.m solves Kolmogorov's forward equation for the SDE 
% dX(t) = sin(X(t))dt + sigma * dB(t) with X(0)=0.

% Parabolic PDE demo by Gordon Wade, BGSU, 1997
% Purpose: "Demo" for solving the parabolic PDE
% -------
%            u_t = (au_x)_x + bu_x + cu,        x in [0,1], t in (0,Tf],
%              u = u0                           t=0, 
%            u_x = 0                            x=0 and x=1.
% 
%   The "user" gets to specify:
%       * The coef's a, b, and c, 
%       * The initial condition u0, 
%       * The "final time", Tf, 
%       * The grid sizes, nt and nx 
%         (number of subintervals in x and t, resp.)
%       * "Tfixed", a (possible very large) time at which 
%         the solution ufixed = u(Tfixed) will be evaluated. 
% 
% -----------------------------------------------------------------
% PROBLEM SPECIFICATION
% Set the final time and the grids. 
  Tf = 6;                            % maximum time to run to
  Tfixed=6;                          % time at which to display the solution
  nx = 150;                          % number of spatial grid points
  nt = 100;                          % number of time steps

  dx = 1/nx;
  dt = Tf/nt;
  x  = (0:dx:1)';
  t  = (0:dt:Tf);
  xc = (dx/2:dx:1-dx/2)';

% The spatial limits are set here
  xmin = -11*pi;                     % minimum x value
  xmax = 11*pi;                      % maximum x value

  p = xmax-xmin;                     % length of the interval
  yc = xmin + p*xc;                  % centered points along the interval

% The coefficients a, b, c are set here. 

  sigma = 3;                         % diffusion coefficient
  a = (sigma^2)*ones(size(yc))/2;    % constant diffusion coefficient
  b = -sin(yc);                      % sinusoidal drift
  c = -cos(yc);                      % derivative of drift for adjoint

% The initial condition is set here to be concentrated at the center
% of the interval

  u0 = zeros(size(x));               % density of X(0)
  [junk,imid]=min(abs(x-1/2));       % find the midpoint
  u0(imid) = 1;                      % make a sharp spike in the initial cond.
                                     % sum(u0)=1 for normalization

% ----------------------------------------------------------------------------

  a=a/(p^2);                         % scale the coefficients for the algorithm
  b=b/p;
  u0=u0*nx/p;                        % normalization is now sum(u0)*p/nx=1

% Set up the mass and stiffness matrices, and the final matrix "A"
% such that u'(t) = Au(t). 
  A1 = make_A1(a);
  A2 = make_A2(b);
  A3 = make_A3(c);
  M = make_A3(ones(size(c)));
  A = M\(A1 + A2 + A3);
  emax = max(real(eig(A)));
  A = A-emax*eye(size(A));

% Do the time stepping (backward 2nd order RK, 
%                       which is accurate, stable and dissipative).
  G = inv(eye(size(A)) - dt*A + (dt*A)^2/2 );
  u = u0;
  U = [];
  for j=1:nt;
     u = G*u;
     U = [U,u];
  end;
  U = U(:,5:nt);
  t = t(:,5:nt);
 
% Display the solution's evolution over time
  figure(1);
     y = xmin + p*x;                  % points along the interval
     mesh(t,y,U); 
%     Map = colormap; Map = ones(size(Map)); colormap(Map);
     title('Evolution of density over time');
     xlabel('x axis');
     ylabel('time');
     drawnow;
   
% Evaluate and display u(Tfixed).
  figure(2);
     ufixed = expm(A*Tfixed)*u0;
     plot(y,ufixed);
     title('Density at time 6');
     grid on;


