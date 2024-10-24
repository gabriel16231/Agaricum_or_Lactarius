function []=matrice_confuzie(e,A,X,x)
[N,n]=size(A);
pred = SoftPlus_param(A,X) * x;

s_pred = rescale(pred);

for i = 1 : N

        if(s_pred(i) < 0.5)

            s_pred(i) = 0;

        else

            s_pred(i) = 1;

        end

end

C = confusionmat(e, s_pred)

TP = C(1,1); 
FN = C(1,2); 
FP = C(2,1); 
TN = C(2,2); 

precision= TP / (TP + FP)
recall= TP / (TP + FN)
f1Score= 2 * (precision * recall) / (precision + recall)

disp(['F1 : ', num2str(f1Score)]);
end