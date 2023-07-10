syms x 
% Working out the actual integral with g_1
I1=int(exp(x)*sqrt(1-x*x),-1,1);
I1=eval(I1)
% Working out the actual integral with g_2
I2=int(x*sin(x)*sqrt(1-x*x),-1,1);
I2=eval(I2)
% MATLAB cannot give any useful information so we will have to use it's own
% quadrature rule to evaluate the integral with g_2
% Using MATLAB's quadrature rule to evaluate the integral
tol=1e-10; % defining the tolerance or accuracy
Iq2 = integral(@(x)x.*sin(x).*sqrt(1-x.^2),-1,1,'AbsTol',tol)
