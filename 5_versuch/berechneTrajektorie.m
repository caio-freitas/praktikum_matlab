function stTraj = berechneTrajektorie(stPendel, Q, R, T)
    %  Gibt eine Struktur mit Inhalt Uebergangszeit T, Zeitvektor t,
    %  Zustandsvektor x und Steuerfolge u zurück
    stTraj.T = linspace(0,T,1000)
    tol=1e-10;
    
    
    odefun = @(t,x) RandwertproblemDGL(t, x, stPendel, Q, R)
    
    guess= @(t) [0 0 0 0 0 0 0 0];
    solinit = bvpinit(stTraj.T, guess);
    %bvpset('RelTol',tol)
    stTraj = bvp4c(odefun, @RandwertproblemRB, solinit)    
end

