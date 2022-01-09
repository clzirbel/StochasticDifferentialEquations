wiener <- function(N) {
  t <- seq(0, N)/N
  W <- c(0, cumsum(rnorm(N)))
  max <- 1.1*max(abs(W))
  plot(t, W, ylim=c(-max,max), xlim = c(0,1), main = paste(N,"-step version of the Wiener process and its mean"))
  abline(h=0)
  return(W)
}

wiener(100)