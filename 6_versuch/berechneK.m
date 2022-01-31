function [vTK, mK] = berechneK(stTraj, Q, R)

    [A_T, B_T, C_T, D_T] = linearisierung_XU(stTraj.mX(end,:)', stTraj.vU(end,:)); % Am Zeitpunkt T
    
    % Jetzt muss die Gleichung 
    % 0 = AP + PA + Q - PBR^{−1}B'P
    % gelöst werden
    E = eye(size(A_T,1));
    S = zeros(size(A_T,1),1);
    P_T = care(A_T, B_T, Q, R, zeros(size(B_T)), eye(length(A_T))); % Endwert P ist die Lösung
    P_T = (P_T(:).')';
    % Dann ist P(t) rückwärts gelöst durch der Riccati-DGL
    % mit "ode...()"
    odefun = @(t, vP) RiccatiDGL(t, vP, stTraj, Q, R);

    [vTK, vP] = ode45(odefun, flipud(stTraj.vT), P_T)
    vTK = flipud(vTK);
    vP = flipud(vP);

    % mK muss für jeden Zeitpunkt berechnet werden
    for ii = 1:length(vTK)
        xi = stTraj.mX(ii,:);
        ui = stTraj.vU(ii);
        [Ai,Bi,Ci,Di] = linearisierung_XU(xi',ui);
        Pi = vP(ii,:);
        Pi = reshape(Pi,length(A_T),length(A_T) );
        mK(1:4,ii) = inv(R)*Bi'*Pi; % Formel 20.8 vom Skript
    end
end