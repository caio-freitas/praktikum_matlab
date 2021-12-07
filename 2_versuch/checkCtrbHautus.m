function checkCtrbHautus(A, B)
    syms s;
    hautus_ctrb = true;
    n = max(size(A));
    eigs = eig(A);
    MSH = [s*eye(n)-A B];
    for i=1:max(size(eigs))
        s=eigs(i);
        if rank(subs(MSH))<n
            hautus_ctrb=false;
        end
    end
    hautus_ctrb
end