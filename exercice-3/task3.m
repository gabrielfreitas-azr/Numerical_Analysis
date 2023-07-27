clc;
clear;

A = [15 2 3 4; 2 5 7 5; 3 7 9 6; 4 5 6 7];

my_eigvalues = computeEigvalues(A);

my_eigvalues

[e] = eig(A);

e