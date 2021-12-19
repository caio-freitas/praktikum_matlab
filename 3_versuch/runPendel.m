function [vT, mX, vU] = runPendel(stPendel, AP, K,  x0)
    [f, h] = nonlinear_model();
    [A_AP, B_AP, C_AP, D_AP] = linearisierung(f,h,AP);
    
    stOptions = simset( 'SrcWorkspace', 'current' );    
    sim("Regelung_V3.slx", 10, stOptions);
    vT = mZustand.Time;
    mX = mZustand.Data;
    vU = vInput.Data;
end