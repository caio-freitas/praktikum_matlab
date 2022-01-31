function [A, B, C, D] = linearisierung_XU(x_T, u_T)
    syms phi1 dphi1 phi2 dphi2 M
    x=[phi1, dphi1, phi2, dphi2];
    u=[M];
    
    [f, h] = nonlinear_model();

    Asim = jacobian(f, x);
    Bsim = jacobian(f, u);
    Csim = jacobian(h, x);
    Dsim = jacobian(h, u);

    A = (subs(Asim, [x, u],[x_T', u_T']));
    B = (subs(Bsim, [x, u],[x_T', u_T']));
    C = (subs(Csim, [x, u],[x_T', u_T']));
    D = (subs(Dsim, [x, u],[x_T', u_T'])); 
    A = double(A);
    B = double(B);
    C = double(C);
    D = double(D);
end