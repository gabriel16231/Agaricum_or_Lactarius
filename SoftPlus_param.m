function [g]=SoftPlus_param(A,X)
a=0.5;
b=-1;
[N,n]=size(A);
[~,m]=size(X);
g=zeros(N,m);
for i=1:N
    for j=1:m
        g(i,j)=a*(log( exp(A(i,:)*X(:,j)) + 1) - b);
    end
end
end