function [x,w]=getquad(n)
% This function returns a vector of the quadrature nodes x and weights w of
% dimension n
% Creating the matrix An
An=diag(0.5*ones(1,n-1),1)+diag(0.5*ones(1,n-1),-1);
% Working out the Eigenvectors and Eigenvalues of An
[Eigenvector,Eigenvalue]=eig(An,'vector');
x=zeros(1,n);
% Transposing the Eigenvalue into a row vector
Eigenvalue=transpose(Eigenvalue);
for i=1:n
    % Working out the quadrature nodes
    x(i)=Eigenvalue(i);
end
w=zeros(1,n);
for j=1:n
    % Working out the weights
    w(j)=(pi/2)*(1/(sum(Eigenvector(:,j).^2)))*(Eigenvector(1,j))^2;
end
end