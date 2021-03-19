clc;
clear all;
close all;
B=[2 1 -1 1
   0 3 1 0
   5 3 2 1
   6 6 1 3];
A=[1 0 0 0
   0 1 0 0
   0 0 1 0
   0 0 0 1];

C=(A^-1)*B
