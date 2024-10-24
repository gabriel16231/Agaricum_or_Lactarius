function [gradx]=gradx(e,A,X,x)

[N,n]=size(A);
[~,m]=size(X);
gradx=zeros(m,1);

for k=1:m

    sum=0;
    for i=1:N
        sum= sum + e(i)*(1/(SoftPlus_param(A(i,:),X)*x)) * ...
            SoftPlus_param(A(i,:),X(:,k)) + ...
            (1-e(i)) * (1/(1-SoftPlus_param(A(i,:),X)*x)) * ...
            SoftPlus_param(A(i,:),X(:,k));
    end

    gradx(k)=-sum/N;

end

end