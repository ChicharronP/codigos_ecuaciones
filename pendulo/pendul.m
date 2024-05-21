% pendul - Program to compute the motion of a simple pendulum
% using the Euler method
clear; help pendul
theta = input('Ingrese el angulo inicial (En grados) - ');
theta = theta*pi/180; %Convierte el angulo en radianes
omega = 0;
tau = input('Ingrese el tiempo inicial - ');
g_over_L = 1;
time_old = -1;
irev = 0;
nstep = 300;
time = 0;
%%%%% MAIN LOOP %%%%%
for istep=1:nstep
  t_plot(istep) = time;
  th_plot(istep) = theta*180/pi;
  accel = -g_over_L*sin(theta);
  theta_old = theta;
  theta = theta + tau*omega;
  omega = omega + tau*accel;
  time = time + tau;
  if (theta*theta_old < 0)
    fprintf('Turning point at time t=%f  \n', time);
    if( time_old < 0 )
      time_old = time;
    else
      irev = irev + 1;
      period(irev) = 2*(time - time_old);
      time_old = time;
    end
  end
end
%gráfica
plot(t_plot, th_plot, '+');
xlabel('time');
ylabel('Theta (degrees)');
title('Simple pendulum')


