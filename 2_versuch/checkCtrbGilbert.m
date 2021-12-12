function checkCtrbGilbert(A, B)
    [A_til, B_til, C_til, D_til] = canon(A, B, eye(max(size(A))), zeros(size(B)))
    gilbertCtrb = (rank(B_til) == size(B_til, 2));
    for i=1:size(B_til,1)
        if all(B_til(i,:)==0)
            gilbertCtrb = false
        end
    end
    gilbertCtrb
end