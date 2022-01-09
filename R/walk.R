# calculate the sum of 1+2+...+300

N = 50
t <- numeric()
S <- numeric()
t[1] = 0
S[1] = 0

for(j in 1:N)
{
  t[j+1] <- j
  S[j+1] <- S[j] + 2*(runif(1) > 0.5) - 1
}
if (N <= 50)
{
  plot(t,S,type = "o", pch=19)
}else{
  plot(t,S,type = "l")
}