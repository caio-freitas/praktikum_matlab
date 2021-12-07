function [A, B, C, D] = linearisierung(f, h, AP)
    syms phi1 dphi1 phi2 dphi2
    x=[phi1, dphi1, phi2, dphi2];
    u=[];
    A = jacobian(f, x) 
    B = jacobian(f, u)
    C = jacobian(h, x) 
    D = jacobian(h, u)

    A = subs(A,x,AP)
    B = subs(B,u,AP)
    C = subs(C,x,AP)
    D = subs(D,u,AP)
end