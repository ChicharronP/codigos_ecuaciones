% balle - Program to compute the trajectory of a baseball
% using the Euler method.
clear; help balle;
r = input('Enter initial position r=[x,y] - '); % En metros
v = input('Enter initial velocity v=[vx, xy] - '); % metros / segundos
tau = input('Enter timestep, tau - '); % segundos
Cd = 0.35; %Drag coefficient (dimensionless)
rho = 1.2; % Density of air
area = 4.3e-3; % Cross-sectional area of projectile m^2
grav = 9.81; % Gravitational Acceleration
mass = 0.145;
air_const = -0.5*Cd*rho*area/mass;
maxstep = 1000;
%%%%% MAIN LOOP %%%%%
for istep = 1: maxstep
  xplot(istep) = r(1);
  yplot(istep) = r(2);
  accel = air_const*norm(v)*v;
  accel(2) = accel(2) - grav;
  r = r + tau*v;
  v = v + tau*accel;
  if ( r(2) < 0) % Break out of loop when ball hits groud
    break;
  end
end
xplot(istep + 1) = r(1); yplot(istep + 1) = r(2);
fprintf('Rango máximo is %g meters\n', r(1))
fprintf('Tiempo de vuelo is %g seconds\n', istep*tau)
xground = [0 xplot(istep+1)]; yground = [0 0];
% Graficación de la trayectoria de la bola
plot(xplot, yplot, '+', xground, yground, '-');
xlabel('Range (m)')
ylabel('height (m)')
title('projectile motion')

