clc;
clear;

x0 = [1, 1, 1];

sol = fsolve(@task1a_function, x0);

residue = norm(@task1a_function(sol))