clc;
clear;

% Matriz usada no exemplo em sala da 
% professora. 
% (Utilizada aqui como exemplo de entrada)

A = [1 1 1; 1 0 1; 1 0 0];

[Q, R] = decompQR(A);

% A = QR
Q*R