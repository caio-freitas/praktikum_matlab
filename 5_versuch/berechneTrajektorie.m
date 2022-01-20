function stTraj = berechneTrajektorie(stPendel, Q, R, T)
    orig_state = warning;
    warning('off','all')
    %  Gibt eine Struktur mit Inhalt Uebergangszeit T, Zeitvektor t,
    %  Zustandsvektor x und Steuerfolge u zurück
    stTraj.T = T;
    stTraj.vT = linspace(0,T,1000);
    tol=1e-10;
    maxResLimit=1e-3;
    m1 = 0.3;
    m2 = 0.3;
    l1 = 0.2;
    l2 = 0.2;

    %from the double pendel model derivating df/du
    df2du = @(phi1,phi2) 24/(l1^2*(8*m1 + 15*m2 - 9*m2*cos(2*phi1 - 2*phi2)));
    df4du = @(phi1,phi2) -(36*cos(phi1 - phi2))/(l1*l2*(8*m1 + 15*m2 - 9*m2*cos(2*phi1 - 2*phi2)));
    
    odefun = @(t,x) RandwertproblemDGL(t, x, stPendel, Q, R);
    
    solinit.x = [ stTraj.vT];
    solinit.y = [
        linspace(0, pi, 1000);
        zeros(1, 1000);
        linspace(0, pi, 1000);
        zeros(1, 1000);
        zeros(1, 1000);
        zeros(1, 1000);
        zeros(1, 1000);
        zeros(1, 1000)
        ];
    
    %args = bvpset('RelTol',tol);
    args = bvpset();
    for iter = 1:15
        nIter=iter;
        sol = bvp4c(odefun, @RandwertproblemRB, solinit,args);
        if iter>1
            if (sol.stats.maxres-maxRes)/maxRes<maxResLimit %break when difference is less than 0.1%
                break
            end
        end
        maxRes=sol.stats.maxres;
        solinit.y = sol.y; %next solution to refinate results
    end
    disp("Iteractions made: " + nIter)
    disp("Max residual: " + maxRes)
    
    u=zeros(1,1000);
    for i=1:1000
        phi1=sol.y(1,i);
        phi2=sol.y(3,i);
        lambda2=sol.y(6,i);
        lambda4=sol.y(8,i);
        u(i)=-(df2du(phi1,phi2)*lambda2 + df4du(phi1,phi2)*lambda4)/R;
    end
    stTraj.vU=u;
    
    stTraj.mX=sol.y(1:4,:);
    warning(orig_state);
end

