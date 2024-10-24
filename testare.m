function [MEA]=testare(e,A,X,x)
[N,~]=size(A);
sum=0;
for i=1:N
sum=sum + abs(e(i)-SoftPlus_param(A(i,:),X)*x);
end
MEA=sum/N;
end