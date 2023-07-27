% Código utilizado por mim no exercício 3
% para o cálculo da decomposição QR.

function [Q, R] = decompQR(A) 

n = length(A);

Q = [];
R = [];

Q(:, 1) = A(:, 1)/ norm(A(:, 1));
R(1, 1) = norm(A(:, 1));

for j = 2:n
  
  v_j = A(:, j);
  
  for i = 1:j-1
    
    v_j = v_j - (Q(:, i)' * A(:, j)) * Q(:, i);
    R(i, j) = (Q(:, i)' * A(:, j));
      
  endfor
  
  Q(:, j) = v_j/norm(v_j);
  R(j, j) = norm(v_j);
  
endfor

endfunction