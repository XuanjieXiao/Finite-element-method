coord(1,n*(ny+1)+(1:ny+1)) = dx*n;
coord(2,n*(ny+1)+(1:ny+1)) = dy*(0:ny);

n0 = n*(ny+1) + (1:ny);
element(:,2*n*ny+(1:ny)) = [n0+1; n0; n0+ny+1];
element(:,2*n*ny+ny+(1:ny)) = [n0+1; n0+ny+1; n0+ny+2];
BC1=zeros(3,3*(ny+1));
BC1(:,1:ny+1) = [1:ny+1; ones(1,ny+1); zeros(1,ny+1)];
BC1(:,ny+1+(1:ny+1)) = [1:ny+1; 2*ones(1,ny+1); zeros(1,ny+1)];
BC1(:,2*(ny+1)+(1:ny+1))=[nx*(ny+1)+(1:ny+1); ones(1,ny+1); zeros(1,ny+1)];
if ~ShowOn
return
end
hold on; axis equal off
for n=1:size(element,2)
ix=element(:,n);
x=coord(1,ix); y=coord(2,ix);
fill(x,y,ones(size(x)));
end
plot(coord(1,BC1(1,:)),coord(2,BC1(1,:)),'ko');
for n=1:size(coord,2)
text(coord(1,n),coord(2,n),num2str(n));
end