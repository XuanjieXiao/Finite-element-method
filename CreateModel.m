function [coord,element,BC1]=CreateModel(a,b,delta,ShowOn)
nx = round(a/delta); ny = round(b/delta);
dx = a/nx; dy = b/ny;
coord=zeros(2,(nx+1)*(ny+1));
for n=0:nx
coord(1,n*(ny+1)+(1:ny+1)) = dx*n;
coord(2,n*(ny+1)+(1:ny+1)) = dy*(0:ny);
end
element=zeros(3,2*nx*ny);
for n=0:nx-1
n0 = n*(ny+1) + (1:ny);
element(:,2*n*ny+(1:ny)) = [n0+1; n0; n0+ny+1];
element(:,2*n*ny+ny+(1:ny)) = [n0+1; n0+ny+1; n0+ny+2];
end
BC1=zeros(3,3*(ny+1));
BC1(:,1:ny+1) = [1:ny+1; ones(1,ny+1); zeros(1,ny+1)];
BC1(:,ny+1+(1:ny+1)) = [1:ny+1; 2*ones(1,ny+1); zeros(1,ny+1)];
BC1(:,2*(ny+1)+(1:ny+1)) = [nx*(ny+1)+(1:ny+1); ones(1,ny+1); zeros(1,ny+1)];