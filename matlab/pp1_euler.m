% pp_euler.m explores stability for Euler's method in a simple predator prey model without noise

clf

xinit = [12 15 18];
yinit = [1000 1000 1000];

for p=1:3,

  N=10000;                           % number of steps to take
  T=1;                               % maximum time
  h=T/N;                             % time step
  t=(0:h:T);                         % t is the vector [0 1h 2h 3h ... Nh]

  x=zeros(size(t));                  % place to store wolf population size
  y=zeros(size(t));                  % place to store deer population size

  x(1)=xinit(p);                     % initial wolf population
  y(1)=yinit(p);                     % initial deer population

  for i=1:N                          % start taking steps
    x(i+1)=x(i)+0.2*(y(i)-50*x(i))*h;
    y(i+1)=y(i)+4*(20-x(i))*y(i)*h;
  end;

  subplot(3,2,8-2*p);
  plot(x,y);
  axis([10 30 500 1500]);
  title('Euler solution');
  xlabel(['Wolf population size, initially ' int2str(xinit(p))]);
  ylabel(['Deer population size, initially ' int2str(yinit(p))]);

end

subplot(3,2,1);
  plot(t,y);
  axis([0 T 0 1250]);
  title('Deer population size');

subplot(3,2,3);
  plot(t,x);
  axis([0 T 0 25]);
  title('Wolf population size');

subplot(3,2,5);
  xmin = 18;
  xmax = 22;
  ymin = 900;
  ymax = 1100;
  [xg,yg] = meshgrid(xmin:0.2:xmax,ymin:13:ymax);    % prepare points on a grid
  px = 0.2*(yg - 50 .* xg);                % rate of growth of wolf population
  py = 4*(20-xg) .* yg;                    % rate of growth of deer population
  myquiver(xg,yg,px/1500,py/1500)                  % plot the flow field
  axis([xmin xmax ymin ymax]);
  title('Flow field');
  xlabel('Wolf population size');
  ylabel('Deer population size');
