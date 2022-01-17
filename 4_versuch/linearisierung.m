function [A_AP1, B_AP1, C_AP1, D_AP1, M_AP] = linearisierung(f, h, AP)
    syms phi1 dphi1 phi2 dphi2 M
    x=[phi1, dphi1, phi2, dphi2];
    u=[M];
    

    f_M_AP = subs(f(2),x,AP);

    M_AP = solve(f_M_AP == 0 , M);
    A = jacobian(f, x); 
    B = jacobian(f, u);
    C = jacobian(h, x);
    D = jacobian(h, u);

    M_AP = double(M_AP);
    A_AP1 = double(subs(A,[x,u],[AP,M_AP]));
    B_AP1 = double(subs(B,[x,u],[AP,M_AP]));
    C_AP1 = double(subs(C,[x,u],[AP,M_AP]));
    D_AP1 = double(subs(D,[x,u],[AP,M_AP]));
    
end