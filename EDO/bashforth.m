%Ejemplo 4.3
clear;
% Definir la ecuación diferencial a resolver
function py = f(y, t)
  py = -0.025*y + t;
endfunction

% Condiciones iniciales
yo = 0;
to = 0;
dt = 0.25;
tu = 10;
y(1) = yo;
t(1) = to;
n = 1;

% Primer paso con método de Heun (RK2)
k1 = dt * f(y(n), t(n));
k2 = dt * f(y(n) + k1, t(n) + dt);
y(n + 1) = y(n) + (k1 + k2) / 2;
t(n + 1) = t(n) + dt;

% Método de Adams-Bashforth
while t(n + 1) < tu
  n = n + 1;
  y(n + 1) = y(n) + dt * (3 * f(y(n), t(n)) - f(y(n - 1), t(n - 1))) / 2;
  t(n + 1) = t(n) + dt;
end

% Graficar la solución
figure;
plot(t, y, 'b-o');
grid on;
title('Solución numérica de una ecuación diferencial');
xlabel('Tiempo (t)');
ylabel('Solución (y)');

