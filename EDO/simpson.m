%Ejemplo 4.1
%Solución de una ecuación diferencial utilizando
%el método de Simpson (Runge-kuta de 3er orden)
% Ecuacion de ejemplo: p y = f(y,t) = -y + 1
clear
%Definir una ecuacion diferencial a resolver
f = inline('-y+1', 'y', 't');
%
%Condición inicial y tiempos
yo = 0; to = 0; dt = 0.25; tu = 5;
y(1)=yo; t(1) = to;
n=0;
%Solución numérica
while t(n+1) < tu
  n=n+1;
  k1=dt*f(y(n), t(n));
  k2=dt*f(y(n) + k1/2, t(n) + dt/2);
  k3= dt*f(y(n) - k1+2*k2, t(n)+ dt);
  y(n+1) = y(n) + (k1+4*k2+k3) / 6;
  t(n+1) = t(n) +dt;
end
%graficar la solución
plot(t,y,'+b')
grid on
title('Solución de p y=-y + 1 por el método de Simpson')
xlabel('tiempo'),ylabel('y(t)')
