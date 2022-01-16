function [vT, mX, mXobs] = runPendel(stPendel, AP, K,  x0, stObs)
    [f, h] = nonlinear_model();
    [stObs.A, stObs.B, stObs.C, stObs.D, M_AP] = linearisierung(f,h,AP);

    stOptions = simset( 'SrcWorkspace', 'current' );    
    sim("Regelung_V4.slx", 5, stOptions);
    
    vT = mZustand.Time;
    mX = mZustand.Data;
    vU = vInput.Data;
    mXobs = mBeobachter.Data;
end