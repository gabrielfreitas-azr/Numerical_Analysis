clc
clear

A = [2 3 3; 
     6 1 0; 
     9 5 2]
    
printf("Dada a matriz A, com as funções implementadas por mim, calcula-se a decomposição SVD: \n")   
 
[U, S, V] = decompSVD(A);

U
S
V

printf("A matriz A, de fato, pode ser escrita como: \n")

U * S * V'



