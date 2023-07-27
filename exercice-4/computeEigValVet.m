function [eigvalues, V] = computeEigValVet(S)

n = size(S);

tol = 1E-8;
k_max = 500;
k = 0;
error = 1;

V = eye(n);

while error > tol && k < k_max

  [Q, R] = decompQR(S);
  S = R * Q;
  
  tri_lower = abs(tril(S)); 
 
  max_element_row = max(tri_lower);
  
  error = max(max_element_row);

  V = V * Q;
  
  k++;
  
endwhile

eigvalues = diag(S);


endfunction
