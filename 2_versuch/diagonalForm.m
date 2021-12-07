function [AD, BD, CD, DD] = diagonalForm( A, B, C, D )
    [T, D] = eig(A);
    Tinv = inv(T);
    AD = Tinv*A*T;
    BD = Tinv*B;
    CD = C*T;
    DD = D; 
end