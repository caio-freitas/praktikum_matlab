function [A_AP1, B_AP1, C_AP1, D_AP1] = linearisierung(f, h, AP)
    syms phi1 dphi1 phi2 dphi2
    x=[phi1, dphi1, phi2, dphi2];
    u=[];
    A = jacobian(f, x); 
    B = jacobian(f, u);
    C = jacobian(h, x);
    D = jacobian(h, u);

    A_AP1 = subs(A,x,AP);
    B_AP1 = subs(B,u,AP);
    C_AP1 = subs(C,x,AP);
    D_AP1 = subs(D,u,AP);
end