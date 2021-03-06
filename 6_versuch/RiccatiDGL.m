function vPdot = RiccatiDGL(t, vP, stTraj, Q, R)
    mX = interp1(stTraj.vT, stTraj.mX,  t)';
    vU = interp1(stTraj.vT, stTraj.vU,  t);
    [A, B, C, D] = linearisierung_XU(mX, vU);
    P = reshape(vP, size(A,1),size(A,2));
    vPdot = P*B*inv(R)*B'*P - P*A - A'*P - Q;
    vPdot = (vPdot(:).')';
end