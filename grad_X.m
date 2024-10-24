function [gradX]=grad_X(e,A,X,x)

a=0.5;

[N,n]= size(A);
[~,m]= size(X);
gradX=zeros(n,m);

for k=1:n

    sum=0;
    for i=1:N
        sum= sum  +e(i)*(1/(SoftPlus_param(A(i,:),X)*x)) *...
            a*(( exp(A(i,:)*X)+ones(1,m)).^(-1) * A(i,k)).*x' +...
        (1-e(i))*(1/(1-SoftPlus_param(A(i,:),X)*x)) *...
            a*(( exp(A(i,:)*X)+ones(1,m)).^(-1) * A(i,k)).*x';
    end

    gradX(k,:)=-sum./N;
    
end

end