function checkCtrbGilbert(A, B)
<<<<<<< HEAD
    [A_til, B_til, C_til, D_til] = canon(A, B, eye(max(size(A))), zeros(size(B)))
    gilbertCtrb = (rank(B_til) == size(B_til, 2));
    for i=1:size(B_til,1)
        if all(B_til(i,:)==0)
            gilbertCtrb = false
=======
    [A_til, B_til, C_til, D_til] = diagonalForm(A, B, eye(max(size(A))), eye(max(size(A))));
    gilbertCtrb = (rank(B_til) == size(B_til, 2));
    for i=1:size(B_til,1)
        if all(B_til(i,:)==0)
            gilbertCtrb = false;
>>>>>>> db67a81458d8d5ed0365c32ddb38ff3c782f3ba3
        end
    end
    gilbertCtrb
end