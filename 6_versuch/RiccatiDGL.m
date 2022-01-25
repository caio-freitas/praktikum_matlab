function vPdot = RiccatiDGL(t, vP, stTraj, Q, R)
    mX = interp1(stTraj.vT, stTraj.mX,  t);
    vU = interp1(stTraj.vT, stTraj.vU,  t);
    [A, B, C, D] = linearisierung_XU(mX, vU);

    [A_T, B_T, C_T, D_T] = linearisierung_XU(stTraj.mX(size(stTraj.mX,1),:), stTraj.vU(size(stTraj.vU,1),:)); % Am Zeitpunkt T

    % Jetzt muss die Gleichung 
    % 0 = PBR^{−1}B'P - PA - AP - Q = 0
    % gelöst werden (mit "care()"?)
    
    % Endwert P ist die Lösung

    % Dann ist P(t) rückwärts gelöst
    % mit "ode...()"?

    
end