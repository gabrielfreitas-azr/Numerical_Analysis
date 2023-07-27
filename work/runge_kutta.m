function [theta1_t, theta2_t, t] = runge_kutta(Z, dt)

  theta1_t = [Z(1)];
  theta2_t = [Z(2)];
  t = [0];
  
  k_max = 1000;
  
  for i = 1:k_max
 
    k1 = dt * f(Z);
    k2 = dt * f(Z + k1 / 2);
    k3 = dt * f(Z + k2 / 2);
    k4 = dt * f(Z + k3);
    
    Z = Z + 1 / 6 * (k1 + 2 * k2 + 2 * k3 + k4);

    theta1_t(end + 1) = Z(1);
    theta2_t(end + 1) = Z(2);
    t(end + 1) = dt * i;
    
  endfor 
  
endfunction
