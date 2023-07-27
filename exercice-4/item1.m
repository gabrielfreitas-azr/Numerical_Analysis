clc
clear

S = [1 2 3; 
     2 1 4; 
     3 4 1]

printf("Dada a matriz simétrica S, seus autovalores serão dados pelas matrizes lambda e seus autovetores pelos vetores coluna das matrizes x.\nPrimeiramente, com as funções implementadas por mim, na atividade:\n")

[lambda, x] = computeEigValVet(S);

lambda
x

printf("Agora, para as funções prontas do MATLAB, para fins de prova real.\n")

[x, lambda] = eig(S);

lambda = diag(lambda)
x 