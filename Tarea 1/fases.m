function [b, I_b, I_n] = fases(A, b)
[n, m] = size(A);
V_a = eye(n)
I_a = [m+1:n+m]
%I_e = 
A = [A V_a]
[n, m] = size(A);
c = [zeros(1,m-n),ones(1,n)]
I_b=[m-1,m]
I_n = [1:m-2]


[x_hat, I_b, I_n] = iteration(A, b, c, I_b, I_n);

I_n = setdiff(I_n, I_a)

if any(x_hat(I_a) ~= 0)
    disp('No tiene solucion factible: Variables artificiales distintas de cero')
    b = false
elseif any(ismember(I_a, I_b))
    [I_bn, I_bm] = size(I_b)
    I_b = setdiff(I_b, I_a)
    [a, b] = size(I_b)
    for i = 1:(I_bm-b)
        randomIndex = randi(length(I_n), 1)
        nb = I_n(randomIndex)
        I_n(randomIndex) = []
        I_b = [I_b, nb]
    end
disp(x_hat)
end

