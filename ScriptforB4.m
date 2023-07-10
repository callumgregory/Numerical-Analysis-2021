quadvec1=zeros(1,20);
quadvec2=zeros(1,20);
syms y
% Working out the actual integral with g_1
I1=int(exp(y)*sqrt(1-y*y),-1,1);
% Working out the actual integral with g_2
I2=int(y*sin(y)*sqrt(1-y*y),-1,1);
errorvec1=zeros(1,20);
errorvec2=zeros(1,20);
for i=1:20
    % Finding the quadrature nodes and the weights
    [x,w]=getquad(i);
    % Using the quadrature rule with g_1
    quadvec1(i)=myquad(@(x) exp(x),x,w);
    % Using the quadrature rule with g_2
    quadvec2(i)=myquad(@(x) x.*sin(x),x,w);
    % Working out the error between the actual integral and the
    % quadrature rules
    errorvec1(i)=abs(quadvec1(i)-I1);
    errorvec2(i)=abs(quadvec2(i)-I2);
end
% Plotting a graph of the error
semilogy(1:20,errorvec1,'g')
hold on
semilogy(1:20,errorvec2,'b')
title1=title('Plot of the Error for each Quadrature rule');
leg1=legend('Error with $g_1(x)=exp(x)$','Error with $g_2(x)=xsin(x)$');
set(leg1,'Interpreter','latex');
set(title1,'Interpreter','latex');