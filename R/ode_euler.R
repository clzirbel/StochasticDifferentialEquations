ode_euler <- function(T, h, F = function(z, t) {return(-z)}) {
  N <- ceiling(T/h) # number of steps to take
  t <- numeric(N)
  z <- numeric(N)
  t[1] <- 0
  z[1] <- 2
  for(i in 1:(N-1)) {
    t[i+1] <-  t[i] + h
    z[i+1] <- z[i] + F(z[i], t[i])*h
  }
  plot(t, z, type = "l", xlim=c(0, T), ylim=c(min(z)-2, max(z)+2))
  abline(h=0)
  grid()
  list(t=t, z=z)
}

out <- ode_euler(T=7, h=0.01)
