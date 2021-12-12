function checkCtrbGilbert(A, B)
    [A_til, B_til, C_til, D_til] = diagonalForm(A, B, eye(max(size(A))), eye(max(size(A))));
    gilbertCtrb = (rank(B_til) == size(B_til, 2));
    for i=1:size(B_til,1)
        if all(B_til(i,:)==0)
            gilbertCtrb = false;
        end
    end
    gilbertCtrb
end