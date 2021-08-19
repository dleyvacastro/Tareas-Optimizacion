function index = razon_minima(X_b, Y_k)
    x_k = X_b./Y_k
    s = size(x_k)
    for i = 1:s(1)
        if x_k(i) < 0
            x_k(i) = inf
        end
    end
    [mx_k, index] = min(x_k)
end