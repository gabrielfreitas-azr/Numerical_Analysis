function [U, S, V] = decompSVD (A)

S = A' * A;

[eigvalues, V] = computeEigValVet(S);

% Aplica raiz quadrada em todos os autovalores

S = sqrt(eigvalues);

% Cria uma matriz diagonal com os elementos de S

S = diag(S);

U = A * V * inv(S);

endfunction
