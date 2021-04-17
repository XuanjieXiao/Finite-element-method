function [Ke,Area] = EMPSTRI(EM,t,x,y)
x = x(:); y = y(:);
b = [y(2)-y(3) y(3)-y(1) y(1)-y(2)];
c = [x(3)-x(2) x(1)-x(3) x(2)-x(1)];
Area = det([1 1 1; x' ;y'])/2;
B = zeros(3,6);
for j=1:3
B(:,(1:2)+2*(j-1)) = (1/2/Area)*[b(j) 0; 0 c(j); c(j) b(j)];
end
Ke = Area*t*(B'*EM*B);
