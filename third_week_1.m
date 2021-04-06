%% 代码信息
%author：JamesRemington
%E-mail:xuanjiexiao@163.com
%date:2021-04-04
%copyright:2020-2021
%version 
clc;%清屏
clear all;%清除数据内存
close all;%清楚所有图片
syms x fx;
Detal_w1 = -1-(x-(1/2))*(-x+1);
fx1 = int(Detal_w1,1/2,1);
Detal_w2 = 1^2-(x-(1/2))^2;
fx2 = int(Detal_w2,1/2,1);

b11 = x^2;
b12 = (-x+1)*x;
fxb1 = int(b11,0,1/2)+int(b12,1/2,1);

b21 = 0;
b22 = (x-1/2)*x;
fxb2 = int(b22,1/2,1);

A=[11/12 -25/48
   -25/48 11/24];
B=[1/8 548]';
X=A\B