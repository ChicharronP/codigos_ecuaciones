state = input('Ingrese la posición inicial de [X Y Z] - ');
r = input('Enter el parametro r - ')
s = 10;
b = 8./3.;
param = [r s b];
tau = 1;
err = 1.e-3;
%%%%% MAIN LOOP %%%%%
time = 0;
nstep = 300;
for istep = 1:nstep
  [state, time, tau] = rka(state, time, tau, err, 'lorzrk', param)
  x = state(1); y = state(2); z = state(3);
  tplot(istep) = time; tauplot(istep) = tau;
  xplot(istep) = x; yplot(istep) = y; zplot(istep) = z;
  if (rem(istep,10) < 1)
    fprintf('Terminado %g steps out of %g\n', istep, nstep);
  end
end
% Graficación
plot(tplot, xplot, '-', tplot,zplot,'--')
xlabel('Time'); ylabel('x (solid) and z (dashed)')
pause;
x_ss(1) = 0; y_ss(1) = 0; z_ss(1) = 0;
x_ss(2) = sqrt(b*(r-1)); y_ss(2) = x_ss(2); z_ss(2) = r-1;
x_ss(3) = -sqrt(b*(r-1)); y_ss(3) = x_ss(3); z_ss(3) = r-1;
subplot(121)
  plot(xplot,zplot, '-', x_ss,z_ss,'*')
  xlabel('x'); ylabel('z')
subplot(122)
  plot(xplot, yplot, '-', x_ss, y_ss, '*')
  xlabel('x'); ylabel('y')
subplot(111)

