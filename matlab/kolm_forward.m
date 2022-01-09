% kolm_sine.m solves Kolmogorov's forward equation for the SDE, which finds the density of the solution of a stochastic differential equation.

% The user must set up all the initial values.
% This program simply solves Kolmogorov's forward equation.

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
  U = [u0];
  for j=1:nt-1;
     u = G*u;
     U = [U,u];
  end;
  U = U(:,1:nt);
  t = t(:,1:nt);
 
% Display the solution's evolution over time

  clf
 
  subplot(2,1,1)
     mesh(t,xp,U); 
     axis([0 Tf xmin xmax min(min(U)) max(max(U(:,5:nt)))]);
     title('Evolution of density over time');
     drawnow;
   
  subplot(2,2,3)
     ufixed = expm(A*Tfixed)*u0;
     plot(xp,ufixed);
     title(['Density at time ' int2str(Tf)]);
     grid on;

  subplot(2,2,4)
     secmom = (xp .* xp)' * U;
     plot(t,secmom)
     title('Second moment of X_{t}')


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
