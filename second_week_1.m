clc;
clear all;
close all;
syms a2 a1 x;
eq1=int(a2*x^3+3*a2*x+x+a1*(x^2-2*x+2),0,1)==0;
eq2=int(exp(x)*(a2*x^3+3*a2*x+x+a1*(x^2-2*x+2)),0,1)==0;
solve(eq1,eq2)
A=[4/3 7/4
    -6+3*exp(1) 9-2*exp(1)];
B=[-1/2 -1]';
X=A\B
a3=-0.0324
a4=-0.2611
b1=-2*a3-3*a4
