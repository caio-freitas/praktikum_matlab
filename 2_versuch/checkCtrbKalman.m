function checkCtrbKalman(A, B)
    rank(ctrb(A,B)==max(size(A)))
end