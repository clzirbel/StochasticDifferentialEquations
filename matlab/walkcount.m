% walkcount(N) counts the number of N-step paths which have a given property

% The user must change the property using a conditional, as marked below

function z = walkcount(N)

z = 0;

for i=0:((2^N)-1),
  X = 2*bitget(i,[1:N])-1;
  S = cumsum(X);
  M = max([0 S]);
  if (S(10) == 0) & (M == 0),     % this is the condition that is counted
    z=z+1;
  end
end

break                             % terminate the program

% below are some other conditions that may be used

  if (M == 0), z=z+1; end
  if (M >= 5), z=z+1; end
  if S(10) == 0, z=z+1; end

  if (S(10) == 0) & (M == 0), 
    z=z+1;
    m = max(abs(S));
    plot([0:N], [0 S]);           % plot the paths satisfying the condition
    axis([0 N -m m]);
    i
    pause
  end
