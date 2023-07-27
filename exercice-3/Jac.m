function jacobian = Jac (x)
  jacobian = [2*x(1), 2*x(2), 2*x(3);
             cos(x(1)),  3*x(2)^2, 1;
             2*x(1), -2, 1 ];
endfunction
