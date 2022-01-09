# rando(x) returns a random integer distributed according to probability vector x
rando <- function(x) {
  n <- length(x)
  u <- runif(1)
  i <- 1
  s <- x[1]
  while( (u>s) && (i<n)) {
    i <- i+1
    s <- s + x[i]
  }
  i
}

X <- c(0.1, 0.3, 0.1, 0.5)    # probability mass function
X <- X/sum(X)

# generating sample
n <- 1e4
XT <- as.vector(table(replicate(n, rando(X)))/n)   

# comparing sample distribution with requested pmf
eps = 100*sum(abs(X-XT))
plot(X, ylim=c(0,1), col="red", main = paste("eps=", round(eps,1), "%"))
points(XT, type="p", col="blue")
legend("topright", legend = c("original", "rando"), pch=1, col=c("blue", "red"))

