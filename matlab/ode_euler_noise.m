% ode_euler_noise(N,r,alpha) uses the Euler method with noise and N steps
% It illustrates the effect of using smaller time steps

% ode_euler_noise(1,

figure(1)
clf

sigma = 1;                   % strength of the noise

T = 7;                       % maximum time to go to
M = [5 10 100 1000 10000]*T;   % illustrate different numbers of steps

for v = 1:length(M)
  N = M(v);                  % set the number of steps for this realization
  h = T/N;                   % time step

  t = zeros(1,N+1);          % prepare a place to store times
  Y = zeros(1,N+1);          % prepare a place to store locations

  t(1) = 0;                  % initial time
  Y(1) = 3;                  % initial location

  for i=1:N                  % take N steps
    t(i+1) = t(i) + h;       % move to next time point
    Y(i+1) = Y(i)-Y(i)*h+sigma*randn*sqrt(h);  % the function here is f(z) = -z
  end;

  subplot(length(M),1,v)     % subplot v
  plot(t,Y,'b');             % plot Y versus t in blue
  hold on
  plot([0 T], [0 0],'r:');   % plot x axis in red
  if N < 15,
    plot(t,Y,'b.')           % plot dots on solution when N is small
  end
  axis([0 T (min(Y)-1) (max(Y)+1)]);   % set axis limits according to Y
  title(['Exponential decay to 0 in ' int2str(N) ' steps, h = ' num2str(h) ', \sigma = ' num2str(sigma)]);
end

orient tall
saveas(gcf,['ode_euler_noise_sigma_' strrep(num2str(sigma),'.','-') '.pdf'], 'pdf');
