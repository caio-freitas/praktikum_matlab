function [f, h] = nonlinear_model()
%NONLINEAR_MODEL gibt die nichtlineare Bewegungsgleichung des
%Doppelpendelsystems ohne Reibung in Form von eines Zustandsraumsystems
%zurück.
% Ausgänge: 
%   f: Dynamik
%   h: Ausgangsfunktion
 syms phi1 phi2 dphi1 dphi2 ddphi1 ddphi2 M
    f = [dphi1;
        (750*((9*sin(2*phi1 - 2*phi2)*dphi1^2)/2500 ...
        + (3*sin(phi1 - phi2)*dphi2^2)/625 - (4*M)/5 ...
        + (8829*sin(phi1 - 2*phi2))/50000 ...
        + (26487*sin(phi1))/50000))/((27*cos(2*phi1 - 2*phi2))/10 - 69/10);
        
        dphi2;
        -(2500*((18*sin(phi1 - phi2)*dphi1^2)/3125 ...
        + (27*sin(2*phi1 - 2*phi2)*dphi2^2)/25000 ...
        + (79461*sin(2*phi1 - phi2))/500000 - (61803*sin(phi2))/500000 ...
        - (9*M*cos(phi1 - phi2))/25))/((27*cos(2*phi1 - 2*phi2))/10 - 69/10)];

     h = [phi1;
         phi2];
end