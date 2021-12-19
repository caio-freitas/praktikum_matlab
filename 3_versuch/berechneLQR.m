function [K, poleRK] = berechneLQR(A, B, Q, R)
    
	% Fehlerabfragen:  
	if size(A,1) ~= size(A,2)
        "A muss quadratisch sein"
        return
    end
    if size(B,1) ~= size(A,1)
        "A und B mussen die gleiche Anzahl von Zeilen haben"
        return
    end
    %%% noch anderen
    n = size(A,1);
    p = size(B,2);
	% Steuerbarkeit
    sys_steuerbar = (rank(ctrb(A,B))==n)

	% Test auf Symmetrie von Q:
    Q_simetrisch = issymmetric(Q)

	% Test auf positive Definitheit:
    eig_Q = eig(Q);
    eig_R = eig(R);
    pd = all(eig_Q>0) & all(eig_R>0)
	
	% Reglerberechnung:
    [K, S, clp] = lqr( ss(A, B, eye(n), zeros(n,p)) , Q, R);
    
    % poleRK: Pole geschlossener Regelkreis
	poleRK = clp
    % oder einfach poleRK = eig(A-B*K)
end
