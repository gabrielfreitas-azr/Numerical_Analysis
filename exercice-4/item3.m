clc
clear

% Gera uma matriz 3x3 com números inteiros aleatórios de 1 até 10
A = randi(10, 3, 3)

printf("Dada a matriz A, com as funções implementadas por mim, calcula-se a decomposição SVD: \n")   
 
[U, S, V] = decompSVD(A);

U
S
V

U * S * V'

printf("Agora, com a função do MATLAB: \n")

[U, S, V] = svd(A);

U
S
V

U * S * V'

printf("E de fato, a decomposição SVD não é única, mas ambas retornam ao vetor de origem.")