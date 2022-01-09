# ode_euler_noise: uses the Euler method with noise and N steps
ode_euler_noise <- function(T=7, N=100, sigma = 0.3) {
  h <- T/N
  t <- numeric(N)
  z <- numeric(N)
  t[1] <-  0
  z[1] <- 3
  for(i in 1:(N-1)) {
    t[i+1] <- t[i] + h
    z[i+1] <- z[i] - z[i]*h + sigma*rnorm(1)*sqrt(h)
  }
  plot(t, z, type = "l", main = paste("Exponential decay to 0 in ", N, " steps, h=", h, " sigma=", sigma, sep=""))
}

ode_euler_noise(T=7, N=100, sigma = 0.1)
