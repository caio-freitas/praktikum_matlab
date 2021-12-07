function checkObsvKalman(A, C)
    rank(obsv(A,C)==max(size(A)))
end