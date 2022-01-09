function A2 = make_A2(b);
% function A2 = make_A2(b);
% Given b(j), j=1:n
  n=max(size(b)); h=1/n;
  d0 = zeros(n+1,1);
  dm1 = -b/2;
  dp1 = b/2;
  A2 = diag(d0) + diag(dm1,-1) + diag(dp1,1);


