function res = RandwertproblemRB(xa, xb)  

	% Spaltenvektor mit den Randwerten 
	% Zuerst die Anfangswerte, dann die Endwerte
	res = [
            xa(1);
            xa(2);
            xa(3);
            xa(4);
            xb(1)-pi;
            xb(2);
            xb(3)-pi;
            xb(4);
            ];
end % function RandwertproblemRB