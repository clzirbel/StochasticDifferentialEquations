% myquiver(x,y,px,py) tries to make a better vector field than quiver

function [void] = myquiver(x,y,px,py)

s = size(x);

dx = max(max(x)) - min(min(x));
dy = max(max(y)) - min(min(y));
n  = (dx.^2 + dy.^2)/2000;

for i=1:s(1),
  for j=1:s(2),
    plot([x(i,j) x(i,j)+px(i,j)],[y(i,j) y(i,j)+py(i,j)]);
    hold on
    if (px(i,j).^2 + py(i,j).^2) > n,
      plot(x(i,j)+px(i,j),y(i,j)+py(i,j),'^','markersize',4);
    else
      plot(x(i,j)+px(i,j),y(i,j)+py(i,j),'^','markersize',2);
    end
  end
end
