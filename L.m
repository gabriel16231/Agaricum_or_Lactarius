function [L]=L(e,A,X,x)
    y=SoftPlus_param(A,X)*x;
    sum=0;
    [N,~]=size(y);
    for i=1:N
        sum=sum+ e(i)*log(y(i))+(1-e(i))*log(1-y(i));
    end
    L=-sum/N;
end