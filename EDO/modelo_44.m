function px=modelo(t,x)
  r=1;Kc=1.5
  e=r-x(1);
  u=Kc*e;
  px1=x(2);
  px2=-x(1)-0.5*x(2)+u;
  px=[px1; px2];

