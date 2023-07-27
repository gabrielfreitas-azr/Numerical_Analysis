function x = nonlimNewton(fun, Jac, x0, tol, nmax)

  x_k = x0;

  for i = 1:nmax
    
    jacobian_k = Jac(x_k);
    f_x = fun(x_k); 
     
    deltax = jacobian_k\(-1*f_x);
    x_k = x_k + deltax;
    
    if norm(deltax) < 1E-8
      break;
    endif
    
  endfor

  x = x_k;


endfunction
