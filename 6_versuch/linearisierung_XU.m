function [A, B, C, D] = linearisierung_XU(x_T, u_T)
    syms phi1 dphi1 phi2 dphi2 M
    x=[phi1, dphi1, phi2, dphi2];
    u=[M];
    
    [f, h] = nonlinear_model();

    Asim = jacobian(f, x);
    Bsim = jacobian(f, u);
    Csim = jacobian(h, x);
    Dsim = jacobian(h, u);

    A = double(subs(subs(Asim, x, x_T), u, u_T));
    B = double(subs(subs(Bsim, x, x_T), u, u_T));
    C = double(subs(subs(Csim, x, x_T), u, u_T));
    D = double(subs(subs(Dsim, x, x_T), u, u_T)); 
end