
Z0 = [3.14 / 2;       # Angle of first pendulum
      3.14 / 2;    # Angle of second pendulum 
      0;           # Momentum of first mass
      0];           # Momentum of second mass
      

[theta1_t, theta2_t, t] = runge_kutta(Z0, 0.01);

y1 = [];
y2 = [];

for i = 1:length(t)
   
  y1(end + 1) = -1 * cos(theta1_t(i));
  y2(end + 1) = y1(i) -1 * cos(theta2_t(i));

endfor

x1 = [];
x2 = [];

for i = 1:length(t)
   
  x1(end + 1) = 1 * sin(theta1_t(i));
  x2(end + 1) = x1(i) + 1 * sin(theta2_t(i));

endfor

plot(x2, y2, "b", 'linewidth', 1.5, x1, y1, "r", 'linewidth', 1.5);   

xlim([-2, 2]);
ylim([-2, 2]);

xlabel("x (m)");
ylabel("y (m)");
title('Posição');
grid on;
