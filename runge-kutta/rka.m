function [x, t, tau] = rka(x,t,tau,err,derivsRK,param)
  tsave = t; xsave = x;
  safel = .9; safe2 = 4.;
  maxtry = 100;
  for itry = 1:maxtry
    half_tau = 0.5 * tau;
    xtemp = rk4(xsave, tsave, half_tau,derivsRK,param);
    t = tsave + tau;
    xtemp = rk4(xsave,tsave, tau, derivsRK, param);
    %% Do the single large step%%
    t = tsave + tau;
    xtemp = rk4(xsave, tsave, tau, derivsRK, param);
    %%Calculo del error%%
    scale = .5*(abs(x) + abs(xtemp))*err;
    xdiff = x - xtemp;
    errmax = max(abs(xdiff)./(scale + eps));
    %% Estimando nuevo tau %%
    tau_old = tau;
    tau = safel*tau_old*errmax^(-.20);
    %% Never decrease tau by more than a factor of safe2 %%
    tau = max(tau,tau_old/safe2);
    if errmax < 1,
      break;

    endif
  end
  tau = min(tau,safe2*tau_old)

