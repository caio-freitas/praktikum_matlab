function [vTK, mK] = berechneK(stTraj, Q, R)

    [A_T, B_T, C_T, D_T] = linearisierung_XU(stTraj.mX(size(stTraj.mX,1),:), stTraj.vU(size(stTraj.vU,1),:)); % Am Zeitpunkt T

    % Jetzt muss die Gleichung 
    % 0 = AP + PA + Q - PBR^{−1}B'P
    % gelöst werden
    E = eye(size(A_T,1));
    S = zeros(size(A_T));
    P_T = care(A_T, B_T, Q, R, S, E); % Endwert P ist die Lösung
    
    % Dann ist P(t) rückwärts gelöst durch der Riccati-DGL
    % mit "ode...()"
    odefun = @(t, vP) RiccatiDGL(t, vP, stTraj, Q, R);

    [t vP] = ode45(odefun, stTraj.vT, P_T);
    
    vPdot = odefun(t, vP);
    
    mK = inv(R)*B'*vP;
    % mK precisa ser resolvido para todos os instantes de tempo vTK
end