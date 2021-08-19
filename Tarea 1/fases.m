function fases(A, b)
[n, m] = size(A);
A = [A eye(n)]
[n, m] = size(A);
c = [zeros(1,m-n),ones(1,n)]
I_b=[m-1,m]
I_n = [1:m-2]

iteration(A, b, c, I_b, I_n)


end
