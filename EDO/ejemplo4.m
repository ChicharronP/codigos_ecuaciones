to=0;tu=20;

function px=modelo(t,x)
  r=1;Kc=1.5;
  e=r-x(1);
  u=Kc*e;
  px1=x(2);
  px2=-x(1)-0.5*x(2)+u;
  px=[px1; px2];
endfunction

[t,y]=ode45(@modelo, [to tu],[0 0]);
plot(t,y(:,1))
grid on
title('Ejemplo del uso de la rutina ODE45')
xlabel('tiempo'), ylabel('y(t)')

