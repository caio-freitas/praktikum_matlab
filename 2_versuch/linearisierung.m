function [A, B, C, D] = linearisierung(f, h, AP)
    syms phi1 dphi1 phi2 dphi2;
    A = jacobian(f, [phi1;dphi1;phi2;dphi2]);
    B = jacobian(f, u); %was ist u?
    C = jacobian(h, [phi1;dphi1;phi2;dphi2]));
    D = jacobian(h, u); %was ist u?

    phi1 = AP(1);
    dphi1 = AP(2);
    phi2 = AP(3);
    dphi2 = AP(4);
    subs(A)
end