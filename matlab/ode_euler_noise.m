% ode_euler_noise(N,r,alpha) uses the Euler method with noise and N steps
% It illustrates the effect of using smaller time steps

% ode_euler_noise(1,

sigma = 1;

figure(1)
clf

T = 7;                       % maximum time to go to
M = [5 10 100 1000 10000];   % illustrate different numbers of steps

for v = 1:length(M)
  N = M(v);                  % set the number of steps for this realization
  h = T/N;                   % time step

  t = zeros(N,1);            % prepare a place to store times
  z = zeros(N,1);            % prepare a place to store locations

  t(1) = 0;                  % initial time
  z(1) = 3;                  % initial location

  for i=1:N                  % take N steps
    t(i+1) = t(i) + h;
    z(i+1) = z(i)-z(i)*h+sigma*randn*sqrt(h);  % the function here is f(z) = -z
  end;

  subplot(V,1,v)
  plot(t,z);          
  hold on
  plot([0 T], [0 0],'r:');
  if N < 15,
    plot(t,z,'.')
  end
  axis([0 T (min(z)-1) (max(z)+1)]);   % set axis limits
  title(['Exponential decay to 0 in ' int2str(N) ' steps, h = ' num2str(h) ', \sigma = ' num2str(sigma)]);
end

orient tall
saveas(gcf,['ode_euler_noise_sigma_' strrep(num2str(sigma),'.','-') '.pdf'], 'pdf');
