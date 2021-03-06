clear all;
clc;
close all;
m=10;n=20;
k=1;
coor = zeros(2,(m+1)*(n+1));

dx = 1/n;
dy = 0.5/m;
x0 = 0;
N = 0;
for j=1:(n+1)
    y0 = 0.5;
    for i=1:(m+1)
        N = N+1;
        coor(1,N) = x0;
        coor(2,N) = y0;
        y0 = y0 - dy;
    end
    x0 = x0+ dx;
end
% coor = [0.0 0.0 0.5 0.5 1.0 1.0
%         0.5 0.0 0.5 0.0 0.5 0.0];
% plot(coor(1,:),coor(2,:),'o');
axis equal;
hold on
elem = zeros(3,m*n);
N = 0;
for j=1:n
    n0 = (m+1)*(j-1);
    for i=1:m
        n0 = n0+1;
        N = N + 1;
        elem(:,N) = [n0 n0+1 n0+1+m+1]';
        N = N + 1;
        elem(:,N) = [n0 n0+1+m+1 n0+m+1]';
        
    end
end


nGrid = size(coor,2);
nElem = size(elem,2);

K = zeros(nGrid,nGrid);

for el=1:nElem
    ix = elem(:,el);
    x = coor(1,ix);
    y = coor(2,ix);
    b = [y(2)-y(3) y(3)-y(1) y(1)-y(2)]';
    c=  [x(3)-x(2) x(1)-x(3) x(2)-x(1)]';
    Delta = det([ones(3,1) x(:) y(:)])/2;
    ke = (k/4/Delta)*(b*b'+c*c');
    K(ix,ix) = K(ix,ix) + ke;
end

left = 1:(m+1);
right = (nGrid-min([m 5])):nGrid;
boundary = [left right];

internal = setdiff(1:nGrid, boundary);
T = zeros(nGrid,1);
T(left) = 130; 
T(right) = 30; 
% b= -K(internal,boundary)*[130*ones(m+1,1); 30*ones(m+1,1)];
b= -K(internal,boundary)*T(boundary);
A = K(internal,internal);
T(internal) = A\b;

for el=1:nElem
    ix = elem(:,el);
    fill(coor(1,ix),coor(2,ix),T(ix))
%     fill(coor(1,[ix; ix(1)]),coor(2,[ix; ix(1)]),ix)
    plot(coor(1,[ix; ix(1)]),coor(2,[ix; ix(1)]), 'k');
end


for el=1:nElem
    ix = elem(:,el);
    
    x = coor(1,ix);
    y = coor(2,ix);
    b = [y(2)-y(3) y(3)-y(1) y(1)-y(2)]';
    c=  [x(3)-x(2) x(1)-x(3) x(2)-x(1)]';
    Delta = det([ones(3,1) x(:) y(:)])/2;
    Te = T(ix);
    q = -(1/2/Delta)*[b'; c']*Te/1000;
    quiver(mean(coor(1,ix)),mean(coor(2,ix)),q(1),q(2));
    
end

