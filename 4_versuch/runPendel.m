function [vT, mX, mXobs] = runPendel(stPendel, AP, K,  x0, stObs)
    sim("Regelung_V4.slx", 5);
    
    vT = mZustand.Time;
    mX = mZustand.Data;
    vU = vInput.Data;
    mXobs = mBeobachter.Data;
end