function deriv = lorzrk(a,time,param)
  x = a(1); y= a(2); z = z(3);
  r = param(1); s = param(2); b = param(3);
  deriv(1) = s*(y-x);   % dx(dt)
  deriv(2) = r*x - y - x*z; % dy/dt
  deriv(3) = x*y - b*z; % dz/dt
  return;
