% deriv - Program to compute the numerical derivates of the
% function fund and compare with the exact value
clear; help derivacion% Clear memory and print header
x = input('ingrese la ubicacion de (x) - ');
h = 0.5
for i=1:9
  hplot(i) = h % Record the value of h for plotting
  % Right and centered first derivates
  derivR(i) = (fund(x+h,0) - fund(x,0)) / h;
  derivC(i) = (fund(x+h,0) - fund(x-h,0)) / (2*h);
  % True first derivates
  derivT(i) = fund(x,1);
  h = h/2; %halve the grid spacing at each iteration
 end
 %plot numerical and true derivative on semi-log scale
 semilogx(hplot,derivR, '+', hplot, derivC, 'o', ...
                                  hplot,derivT,'-')
xlabel('Interval size (h)')
ylabel('First derivative')
title('Right +; centered o; true -')

