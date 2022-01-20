function dxdt = RandwertproblemDGL(t, x, stPendel, sQ, sR)
	% t:			Zeit
	% x:			Zustände x(1) und x(2)
	% Pendeldaten:	Pendeldaten
    % Q:            Gewichtungsmatrix für Zustände
    % R:            Gewichtung für Stellgröße

    l1 = stPendel.l1;
    l2 = stPendel.l2;
    m1 = stPendel.m1;
    m2 = stPendel.m2;
    g = stPendel.g;
    Rp1 = stPendel.Rp1;
    Rp2 = stPendel.Rp2;
    q11 = sQ(1,1);
    q22 = sQ(2,2);
    q33 = sQ(3,3);
    q44 = sQ(4,4);
    sym_R = sR;

	% Differentialgleichung 8ter Ordnung, 
    % x1-x4: Originale Zustände,
    % x5-x8: Lagrange-Multiplikatoren


    phi1 = x(1);
    dphi1 = x(2);
    phi2 = x(3);
    dphi2 = x(4);
    lambda1 = x(5);
    lambda2 = x(6);
    lambda3 = x(7);
    lambda4 = x(8);

    
    dx1 = dphi1;
    dx2 = -(6.0*(4.0*Rp1*dphi1*l2 + 4.0*Rp2*dphi1*l2 - 4.0*Rp2*dphi2*l2 + (4.0*l2*((24.0*lambda2)/(l1^2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - (36.0*lambda4*cos(phi1 - 1.0*phi2))/(l1*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)))))/sym_R + 6.0*Rp2*dphi1*l1*cos(phi1 - 1.0*phi2) - 6.0*Rp2*dphi2*l1*cos(phi1 - 1.0*phi2) + 2.0*dphi2^2*l1*l2^2*m2*sin(phi1 - 1.0*phi2) + 1.5*g*l1*l2*m1*sin(phi1 - 2.0*phi2) + 1.5*dphi1^2*l1^2*l2*m2*sin(2.0*phi1 - 2.0*phi2) + 4.5*g*l1*l2*m1*sin(phi1)))/(l1^2*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)));
    dx3 = dphi2;
    dx4 = (6.0*(4.0*Rp2*dphi1*l1*m1 + 12.0*Rp2*dphi1*l1*m2 - 4.0*Rp2*dphi2*l1*m1 - 12.0*Rp2*dphi2*l1*m2 + 1.5*dphi2^2*l1*l2^2*m2^2*sin(2.0*phi1 - 2.0*phi2) + 6.0*Rp1*dphi1*l2*m2*cos(phi1 - 1.0*phi2) + 6.0*Rp2*dphi1*l2*m2*cos(phi1 - 1.0*phi2) - 6.0*Rp2*dphi2*l2*m2*cos(phi1 - 1.0*phi2) - 2.0*g*l1*l2*m1^2*sin(phi2) + 6.0*dphi1^2*l1^2*l2*m2^2*sin(phi1 - 1.0*phi2) + (6.0*l2*m2*cos(phi1 - 1.0*phi2)*((24.0*lambda2)/(l1^2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - (36.0*lambda4*cos(phi1 - 1.0*phi2))/(l1*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)))))/sym_R - 1.5*g*l1*l2*m1*m2*sin(phi2) + 4.5*g*l1*l2*m1*m2*sin(2.0*phi1 - 1.0*phi2) + 2.0*dphi1^2*l1^2*l2*m1*m2*sin(phi1 - 1.0*phi2)))/(l1*l2^2*m2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)));
    dx5 = lambda4*((108.0*sin(2.0*phi1 - 2.0*phi2)*(4.0*Rp2*dphi1*l1*m1 + 12.0*Rp2*dphi1*l1*m2 - 4.0*Rp2*dphi2*l1*m1 - 12.0*Rp2*dphi2*l1*m2 + 1.5*dphi2^2*l1*l2^2*m2^2*sin(2.0*phi1 - 2.0*phi2) + 6.0*Rp1*dphi1*l2*m2*cos(phi1 - 1.0*phi2) + 6.0*Rp2*dphi1*l2*m2*cos(phi1 - 1.0*phi2) - 6.0*Rp2*dphi2*l2*m2*cos(phi1 - 1.0*phi2) - 2.0*g*l1*l2*m1^2*sin(phi2) + 6.0*dphi1^2*l1^2*l2*m2^2*sin(phi1 - 1.0*phi2) + (6.0*l2*m2*cos(phi1 - 1.0*phi2)*((24.0*lambda2)/(l1^2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - (36.0*lambda4*cos(phi1 - 1.0*phi2))/(l1*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)))))/sym_R - 1.5*g*l1*l2*m1*m2*sin(phi2) + 4.5*g*l1*l2*m1*m2*sin(2.0*phi1 - 1.0*phi2) + 2.0*dphi1^2*l1^2*l2*m1*m2*sin(phi1 - 1.0*phi2)))/(l1*l2^2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))^2) - (6.0*(3.0*dphi2^2*l1*l2^2*m2^2*cos(2.0*phi1 - 2.0*phi2) - 6.0*Rp1*dphi1*l2*m2*sin(phi1 - 1.0*phi2) - 6.0*Rp2*dphi1*l2*m2*sin(phi1 - 1.0*phi2) + 6.0*Rp2*dphi2*l2*m2*sin(phi1 - 1.0*phi2) + 6.0*dphi1^2*l1^2*l2*m2^2*cos(phi1 - 1.0*phi2) - (6.0*l2*m2*sin(phi1 - 1.0*phi2)*((24.0*lambda2)/(l1^2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - (36.0*lambda4*cos(phi1 - 1.0*phi2))/(l1*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)))))/sym_R + 9.0*g*l1*l2*m1*m2*cos(2.0*phi1 - 1.0*phi2) + 2.0*dphi1^2*l1^2*l2*m1*m2*cos(phi1 - 1.0*phi2)))/(l1*l2^2*m2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)))) - 1.0*phi1*q11 + lambda2*((6.0*(6.0*Rp2*dphi2*l1*sin(phi1 - 1.0*phi2) - 6.0*Rp2*dphi1*l1*sin(phi1 - 1.0*phi2) + 2.0*dphi2^2*l1*l2^2*m2*cos(phi1 - 1.0*phi2) + 1.5*g*l1*l2*m1*cos(phi1 - 2.0*phi2) + 3.0*dphi1^2*l1^2*l2*m2*cos(2.0*phi1 - 2.0*phi2) + 4.5*g*l1*l2*m1*cos(phi1)))/(l1^2*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - (108.0*m2*sin(2.0*phi1 - 2.0*phi2)*(4.0*Rp1*dphi1*l2 + 4.0*Rp2*dphi1*l2 - 4.0*Rp2*dphi2*l2 + (4.0*l2*((24.0*lambda2)/(l1^2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - (36.0*lambda4*cos(phi1 - 1.0*phi2))/(l1*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)))))/sym_R + 6.0*Rp2*dphi1*l1*cos(phi1 - 1.0*phi2) - 6.0*Rp2*dphi2*l1*cos(phi1 - 1.0*phi2) + 2.0*dphi2^2*l1*l2^2*m2*sin(phi1 - 1.0*phi2) + 1.5*g*l1*l2*m1*sin(phi1 - 2.0*phi2) + 1.5*dphi1^2*l1^2*l2*m2*sin(2.0*phi1 - 2.0*phi2) + 4.5*g*l1*l2*m1*sin(phi1)))/(l1^2*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))^2));
    dx6 = (6.0*lambda2*(3.0*dphi1*l2*m2*sin(2.0*phi1 - 2.0*phi2)*l1^2 + 6.0*Rp2*cos(phi1 - 1.0*phi2)*l1 + 4.0*Rp1*l2 + 4.0*Rp2*l2))/(l1^2*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - 1.0*dphi1*q22 - 1.0*lambda1 - (6.0*lambda4*(4.0*Rp2*l1*m1 + 12.0*Rp2*l1*m2 + 6.0*Rp1*l2*m2*cos(phi1 - 1.0*phi2) + 6.0*Rp2*l2*m2*cos(phi1 - 1.0*phi2) + 12.0*dphi1*l1^2*l2*m2^2*sin(phi1 - 1.0*phi2) + 4.0*dphi1*l1^2*l2*m1*m2*sin(phi1 - 1.0*phi2)))/(l1*l2^2*m2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)));
    dx7 = - 1.0*phi2*q33 - 1.0*lambda2*((6.0*(3.0*m2*cos(2.0*phi1 - 2.0*phi2)*dphi1^2*l1^2*l2 - 6.0*Rp2*sin(phi1 - 1.0*phi2)*dphi1*l1 + 2.0*m2*cos(phi1 - 1.0*phi2)*dphi2^2*l1*l2^2 + 6.0*Rp2*sin(phi1 - 1.0*phi2)*dphi2*l1 + 3.0*g*m1*cos(phi1 - 2.0*phi2)*l1*l2))/(l1^2*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - (108.0*m2*sin(2.0*phi1 - 2.0*phi2)*(4.0*Rp1*dphi1*l2 + 4.0*Rp2*dphi1*l2 - 4.0*Rp2*dphi2*l2 + (4.0*l2*((24.0*lambda2)/(l1^2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - (36.0*lambda4*cos(phi1 - 1.0*phi2))/(l1*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)))))/sym_R + 6.0*Rp2*dphi1*l1*cos(phi1 - 1.0*phi2) - 6.0*Rp2*dphi2*l1*cos(phi1 - 1.0*phi2) + 2.0*dphi2^2*l1*l2^2*m2*sin(phi1 - 1.0*phi2) + 1.5*g*l1*l2*m1*sin(phi1 - 2.0*phi2) + 1.5*dphi1^2*l1^2*l2*m2*sin(2.0*phi1 - 2.0*phi2) + 4.5*g*l1*l2*m1*sin(phi1)))/(l1^2*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))^2)) - 1.0*lambda4*((108.0*sin(2.0*phi1 - 2.0*phi2)*(4.0*Rp2*dphi1*l1*m1 + 12.0*Rp2*dphi1*l1*m2 - 4.0*Rp2*dphi2*l1*m1 - 12.0*Rp2*dphi2*l1*m2 + 1.5*dphi2^2*l1*l2^2*m2^2*sin(2.0*phi1 - 2.0*phi2) + 6.0*Rp1*dphi1*l2*m2*cos(phi1 - 1.0*phi2) + 6.0*Rp2*dphi1*l2*m2*cos(phi1 - 1.0*phi2) - 6.0*Rp2*dphi2*l2*m2*cos(phi1 - 1.0*phi2) - 2.0*g*l1*l2*m1^2*sin(phi2) + 6.0*dphi1^2*l1^2*l2*m2^2*sin(phi1 - 1.0*phi2) + (6.0*l2*m2*cos(phi1 - 1.0*phi2)*((24.0*lambda2)/(l1^2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - (36.0*lambda4*cos(phi1 - 1.0*phi2))/(l1*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)))))/sym_R - 1.5*g*l1*l2*m1*m2*sin(phi2) + 4.5*g*l1*l2*m1*m2*sin(2.0*phi1 - 1.0*phi2) + 2.0*dphi1^2*l1^2*l2*m1*m2*sin(phi1 - 1.0*phi2)))/(l1*l2^2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))^2) - (6.0*(3.0*dphi2^2*l1*l2^2*m2^2*cos(2.0*phi1 - 2.0*phi2) + 2.0*g*l1*l2*m1^2*cos(phi2) - 6.0*Rp1*dphi1*l2*m2*sin(phi1 - 1.0*phi2) - 6.0*Rp2*dphi1*l2*m2*sin(phi1 - 1.0*phi2) + 6.0*Rp2*dphi2*l2*m2*sin(phi1 - 1.0*phi2) + 6.0*dphi1^2*l1^2*l2*m2^2*cos(phi1 - 1.0*phi2) - (6.0*l2*m2*sin(phi1 - 1.0*phi2)*((24.0*lambda2)/(l1^2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - (36.0*lambda4*cos(phi1 - 1.0*phi2))/(l1*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2)))))/sym_R + 1.5*g*l1*l2*m1*m2*cos(phi2) + 4.5*g*l1*l2*m1*m2*cos(2.0*phi1 - 1.0*phi2) + 2.0*dphi1^2*l1^2*l2*m1*m2*cos(phi1 - 1.0*phi2)))/(l1*l2^2*m2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))));
    dx8 = (6.0*lambda4*(- 3.0*dphi2*l1*sin(2.0*phi1 - 2.0*phi2)*l2^2*m2^2 + 6.0*Rp2*cos(phi1 - 1.0*phi2)*l2*m2 + 12.0*Rp2*l1*m2 + 4.0*Rp2*l1*m1))/(l1*l2^2*m2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - 1.0*dphi2*q44 - (6.0*lambda2*(- 4.0*dphi2*l1*m2*sin(phi1 - 1.0*phi2)*l2^2 + 4.0*Rp2*l2 + 6.0*Rp2*l1*cos(phi1 - 1.0*phi2)))/(l1^2*l2*(8.0*m1 + 15.0*m2 - 9.0*m2*cos(2.0*phi1 - 2.0*phi2))) - 1.0*lambda3;
    
    dxdt = [dx1;dx2;dx3;dx4;dx5;dx6;dx7;dx8]; 




end % function RandwertproblemDGL
