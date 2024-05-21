function R = rombf(a,b,N,func,param)
  % Function to compute integrals by Romberg algorith
  h = b - a;    %This is the coarsest panel size
  %Compute the first term R(1,1)
  R(1,1) = h/2 * (feval (func, a, param) + feval(func,b, param));
  np = 1;         %np is the number of panels
  for i=2:N
    h = h/2;
    np = 2*np;
    sum = 0;
    for k=1:2:np-1  % this for loop goes k=1,3,5,....,np-1
      sum = sum + feval(func, a + k*h, param);
    end
    % Compute the first column entry R(i,1)
    R(i,1) = 1/2 * R(i-1,1) + h * sum;
    m = 1;
    % Compute the other columns R(i,2), ..., R(i,i)
    for j=2:i
      m = 4*m;
      R(i,j) = R(i,j-1) + (R(i,j-1) - R(i-1,j-1)) / (m-1)
    end
  end
  return;

