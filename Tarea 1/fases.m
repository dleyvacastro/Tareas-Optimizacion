function [I_b, I_n] = fases(A, b)
[n, m] = size(A);
I_a = eye(n)
I_e = 
A = [A I_a]
[n, m] = size(A);
c = [zeros(1,m-n),ones(1,n)]
I_b=[m-1,m]
I_n = [1:m-2]

[x_hat, I_b, I_n] = iteration(A, b, c, I_b, I_n);
end

