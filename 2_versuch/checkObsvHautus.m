function checkObsvHautus(A, C)
    syms s;
    hautus_obsv = true;
    n = max(size(A));
    eigs = eig(A);
    MBH = [s*eye(n)-A;C];
    for i=1:max(size(eigs))
        s=eigs(i);
        if rank(subs(MBH))<n
            hautus_obsv=false;
        end
    end
    hautus_obsv
end