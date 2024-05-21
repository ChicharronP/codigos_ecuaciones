function f = fund(x,n)
  % Return function value or derivate
  % fund(x,0) returs the value of the function
  % fund(x,n) returs the value of the nth function
  %           if n=f or 2 else and error
  if (n == 0)
    f = sin(x);
  elseif (n ==1)
    f = cos(x)
  elseif (n ==2)
    f = -sin(x)
  else
    error('Error; bad value for n in fund')
  end
  return;

