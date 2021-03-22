clc;
clear all;
close all;
syms a2 a1 x fx;
Detal_u = a2*x^3+3*a2*x+x+a1*(x^2-2*x+2);
fx = int(Detal_u^2,0,1);
equ1=diff(fx,a1)==0;%求解偏导数，当其为0时候，为极小值，当两个都存在，即为最小值
equ2=diff(fx,a2)==0;
[a1,a2]=solve(equ1,equ2,a1,a2)
Detal_u = a2*x^3+3*a2*x+x+a1*(x^2-2*x+2)

