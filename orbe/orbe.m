% Program to compute the orbit of a comet
% using the Euler method.
clear; clc;

% Input values
r0 = input('Ingrese la distancia radial inicial (AU) - ');
r = [r0 0];
v0 = input('Ingrese la velocidad tangencial inicial (AU/year) - ');
v = [0 v0];
tau = input('Ingrese el tiempo de paso, tau (year) - ');

% Constants
GM = 4*pi^2;
mass = 1.;

% Main loop parameters
time = 0;
nstep = 200;

% Preallocate arrays for efficiency
rplot = zeros(1, nstep);
thplot = zeros(1, nstep);
tplot = zeros(1, nstep);
kinetic = zeros(1, nstep);
potential = zeros(1, nstep);

% Main loop
for istep = 1:nstep
    rplot(istep) = norm(r);
    thplot(istep) = atan2(r(2), r(1));
    tplot(istep) = time;
    kinetic(istep) = 0.5 * mass * norm(v)^2;
    potential(istep) = -GM * mass / norm(r);

    % Compute the new velocity and position
    accel = -GM * r / norm(r)^3; % Gravitational acceleration
    r = r + tau * v; % Update position
    v = v + tau * accel; % Update velocity
    time = time + tau; % Update time
end

% Plotting the comet's trajectory
subplot(121)
polar(thplot, rplot, '+')
grid on
ylabel('Distancia (AU)')
title('Movimiento orbital')

subplot(122)
totalE = kinetic + potential; % Total energy
plot(tplot, kinetic, '-.', tplot, potential, '--', tplot, totalE, '-')
xlabel('Tiempo (años)')
ylabel('Energía')
title('KE (punto y raya); PE (raya); Total (sólido)')
legend('Energía Cinética', 'Energía Potencial', 'Energía Total')
grid on

