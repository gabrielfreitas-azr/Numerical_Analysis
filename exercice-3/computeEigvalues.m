function eigvalues = computeEigvalues(A)

tol = 1E-8;
k_max = 500;
k = 0;
error = 1;

while error > tol && k < k_max

  [Q, R] = decompQR(A);
  A = R * Q;
  
  % Pega a matriz triangular inferior com 
  % 0 nos elementos da diagonal principal.
  % Aplica o módulo nos outros.
  
  tri_lower = abs(tril(A)); 
 
  max_element_row = max(tri_lower);
  
  error = max(max_element_row);

  k++;
  
endwhile

eigvalues = diag(A);

endfunction
