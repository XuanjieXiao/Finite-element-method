clear all;
clc;
close all;
coor = [0.0 0.0 0.5 0.5 1.0 1.0
        0.5 0.0 0.5 0.0 0.5 0.0];
% plot(coor(1,:),coor(2,:),'o');
% axis equal;
% hold on
elem = [1 1 3 3
        2 4 4 6
        4 3 6 5];
nGrid = size(coor,2);
nElem = size(elem,2);

% for el=1:nElem
%     ix = elem(:,el);
%     fill(coor(1,ix),coor(2,ix),0.0)
% end
% b = zeros(3,1);c = b;
k =1;
K = zeros(nGrid,nGrid);
for el=1:nElem
    ix = elem(:,el);
    
    x=coor(1,ix),y=coor(2,ix);
    b = [y(2)-y(3) y(3)-y(1) y(1)-y(2)]';
    c=  [x(3)-x(2) x(1)-x(3) x(2)-x(1)]';
    Delta = det([ones(3,1) x(:) y(:)])/2;
    ke = (k/4/Delta)*(b*b'+c*c');
    K(ix,ix) = K(ix,ix) + ke;
end
b= -K([3 4],[1 2 5 6])*[130 130 30 30]';
A = K([3 4],[3 4]);
x=A\b




