clc;clear all;close all;
YM = 210e9; PR = 0.25; thickness = 0.02;
EM = YM/(1-PR*PR)*[1 PR 0; PR 1 0; 0 0 (1-PR)/2];
a = 0.2; b = 0.001; delta = b/4;
[coord,element,BC1] = CreateModel(a,b,delta,0);
ngrid=size(coord,2);
nelem=size(element,2);
K=zeros(2*ngrid);
P=zeros(2*ngrid,1);
for n=1:nelem
ix=element(:,n);
[ke,area] = EMPSTRI(EM,thickness,coord(1,ix),coord(2,ix));
pe = (area*thickness/3)*9.8*7800*[0 -1 0 -1 0 -1]';
LM = [2*ix(1)+[-1 0] 2*ix(2)+[-1 0] 2*ix(3)+[-1 0]];
K(LM,LM)=K(LM,LM)+ke;
P(LM)=P(LM)+pe;
end
nBC1 = size(BC1,2);
index1 = 2*(BC1(1,1:nBC1)-1) + BC1(2,1:nBC1);
index2=setdiff(1:(2*ngrid),index1);
q = zeros(2*ngrid,1);
q(index1) = BC1(3,:)';
K21 = K(index2,index1);
K22 = K(index2,index2);
P2 = P(index2) - K21*q(index1);
q(index2) = K22\P2;

hold on; axis equal
scale = 100;
for n=1:nelem
ix=element(:,n);
x=coord(1,ix); y=coord(2,ix);
LM = [2*ix(1)+[-1 0] 2*ix(2)+[-1 0] 2*ix(3)+[-1 0]];
uv = scale*reshape(q(LM),2,3);
u = uv(1,:); v = uv(2,:);
fill(x+u,y+v,ones(size(x)));
end