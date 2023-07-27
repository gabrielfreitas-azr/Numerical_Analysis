#
# Function that calculates the parameters of the problem.
#
# Z = 
#     Zn(1) -> angle of first pendulum.
#     Zn(2) -> angle of second pendulum.
#     Zn(3) -> momentum of first pendulum.
#     Zn(4) -> momentum of segond pendulum.

function Zn = f(Z)

  % Defining constants.
  
  g = 9.81;
  l1 = 1;
  l2 = 2;
  m1 = 1;
  m2 = 1000;
  
  % Get parameters.
  
  theta1 = Z(1);
  theta2 = Z(2);
  p1 = Z(3);
  p2 = Z(4);
  
  C = cos(theta1 - theta2);
  S = sin(theta1 - theta2);

  dalpha1_dt = (p1 * l2 - p2 * l1 * C) / (l1^2 * l2 * (m1 + m2 * S^2));
  dalpha2_dt = (p2 * (m1 + m2) * l1 - p1 * m2 * l2 * C) / (m2 * l1 * l2^2 * (m1 + m2 * S^2));
  
  % Compute A1, A2.
  
  A1 = (p1 * p2 * S) / (l1 * l2 * (m1 + m2 * S^2));
  A2 = (p1^2 * m2 * l2^2 - 2 * p1 * p2 * m2 * l1 * l2 * C + p2^2 * (m1 + m2) * l1^2) * (sin(2 * (theta1 - theta2))) / (2 * l1^2 * l2^2 * (m1 + m2 * S^2)^2);
  
  % Compute equations.  
  
  dp1_dt = (-(m1 + m2) * g * l1 * sin(theta1)) - A1 + A2;
  dp2_dt = -m2 * g * l2 * sin(theta2) + A1 - A2;
  
  % Return Zn.
  
  Zn = [dalpha1_dt;
        dalpha2_dt;
        dp1_dt;
        dp2_dt];

endfunction
