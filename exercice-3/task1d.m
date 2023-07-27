clc;
clear;

x0 = [1; 1; 1];

x = nonlimNewton(@task1a_function, @Jac, x0, 1E-8, 1000);

x

residue = norm(task1a_function(x))