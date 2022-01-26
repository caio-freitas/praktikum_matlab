function vPdot = RiccatiDGL(t, vP, stTraj, Q, R)
    mX = interp1(stTraj.vT, stTraj.mX,  t);
    vU = interp1(stTraj.vT, stTraj.vU,  t);
    [A, B, C, D] = linearisierung_XU(mX, vU);
    
    vPdot = vP*B*inv(R)*B'*vP - P*A - A'*P - Q;

    
end