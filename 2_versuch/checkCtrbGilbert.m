function checkCtrbGilbert(A, B)
    [A_til, B_til, C_til, D_til] = diagonalForm(A, B, eye(max(size(A))), eye(max(size(A))));
    rank(B_til) == size(B_til, 2)
end