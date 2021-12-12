function [A_AP1, B_AP1, C_AP1, D_AP1] = linearisierung(f, h, AP)
    syms phi1 dphi1 phi2 dphi2 M
    x=[phi1, dphi1, phi2, dphi2];
    u=[M];
    
    conditions=[phi1==AP(1), dphi1==AP(2), phi2==AP(3),dphi2==AP(4)]
    A = jacobian(f, x); 
    B = jacobian(f, u);
    C = jacobian(h, x);
    D = jacobian(h, u);

    A_AP1 = subs(A,x,AP);
    B_AP1 = subs(B,x,AP);
    C_AP1 = subs(C,x,AP);
    D_AP1 = subs(D,x,AP);
end