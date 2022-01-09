function A3 = make_A3(c);
% function A3 = make_A3(c);
% Given c(j), j=1:n
  n=max(size(c)); h=1/n;
  j=2:n;
  d0 = c(j-1) + c(j); d0 = h*[ c(1); d0 ; c(n) ]/3;
  j=1:n;
  dm1 = c*h/6;
  dp1 = c*h/6;

  A3 = diag(d0) + diag(dm1,-1) + diag(dp1,1);


