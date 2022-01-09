function A1 = make_A1(a);
% function A1 = make_A1(a);
% Given a(j), j=1:n
  n=max(size(a)); h=1/n;
  j=2:n;
  d0 = (a(j-1)+a(j)); d0 = -[a(1);d0;a(n)]/h;
  j=1:n;
  dm1 = [a(j)]/h;
  dp1 = [a(j)]/h;

  A1 = diag(d0) + diag(dm1,-1) + diag(dp1,1);


