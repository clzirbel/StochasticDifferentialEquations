[t,y] = ode45('pp_function',[0 200],[2,1]);
plot(y(:,1), y(:,2))
