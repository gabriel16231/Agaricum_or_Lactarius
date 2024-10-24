function [X,x]=MG(e,A,X,x)
er=10e-4;
max_it=1000;

it=0;
f_prev=0;
f=L(e,A,X,x);

ev_crit=[];

while ((abs(f-f_prev)>= er)&& it<=max_it)
    
    alfax1=1/max(eig(X'*X));
    alfax2=1/max(eig(x'*x));

    gr_X=grad_X(e,A,X,x);
    grad_x=gradx(e,A,X,x);

    X=X+alfax1*gr_X;
    x=x+alfax2*grad_x;

    f_prev=f;
    f=L(e,A,X,x);
    ev_crit=[ev_crit,abs(f-f_prev)];
    
    it=it+1;

end
        interval=1:it;
        
        figure();
        semilogy(interval,ev_crit(1:it));
        grid on;
end