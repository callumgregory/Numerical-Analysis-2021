% Setting a zeros vector
quadvec=zeros(1,21);
for i=1:21
    % Working out the quadrature nodes and weights when n=10
    [x,w]=getquad(10);
    % Using the quadrature rule to work out the output when x^(i-1) for
    % i=1,...,21
    quadvec(i)=myquad(@(x) x.^(i-1),x,w); 
end
nvec=0:20;
intvec=zeros(1,21);
for j=1:21
    % Working out the actual integral for x^(j-1)sqrt(1-x^2) when 
    % j=1,..,21
    syms x 
    intvec(j)=int(x^(j-1)*sqrt(1-x*x),-1,1);
end
% Creating a table that stores quadrature rule, the actual integral and 
% the error when x^(i-1) for i=1,...,21
T1=table(transpose(nvec),transpose(quadvec),transpose(intvec),transpose(intvec)-transpose(quadvec));
T1=renamevars(T1,'Var1','x^i');
T1=renamevars(T1,'Var2','Quadrature Rule');
T1=renamevars(T1,'Var3','Actual Integral');
T1=renamevars(T1,'Var4','Error');
T1