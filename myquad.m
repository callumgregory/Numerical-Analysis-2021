function out=myquad(g,x,w)
% This function evaluates the quadrature for a given function g i.e. it
% evaluates the sum_{i=1,...,n}w_ig(x_i)
if length(x)~=length(w)
    % Checking to see if the number of quadrature nodes = number of weights
    error('There is not the same number of quadrature nodes as weights\n%s','so we cannot work out an approximation for the integral')
else
   out=sum(g(x).*w); 
end
end
