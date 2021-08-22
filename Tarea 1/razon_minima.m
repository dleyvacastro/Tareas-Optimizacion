%function index = razon_minima(X_b, Y_k)
%    x_k = X_b./Y_k
%    s = size(x_k)
%    for i = 1:s(1)
%        if x_k(i) < 0
%            x_k(i) = inf
%        end
%    end
%    [mx_k, index] = min(x_k)
%end
function index = razon_minima(X_b, Y_k, B, A, IB, n)
    s = size(Y_k);
    for i = 1:s(1) % convierte todos los elementos negativos de Y_k en 0 
        if Y_k(i) < 0
            Y_k(i) = 0;
        end
    end
    x_k = X_b./Y_k; %calcula el arreglo bi/Yik
    s = size(x_k); 
    index = []; 
    min = inf;
    for i = 1:s(1);  %ciclo que pasa por cada elemento de x_k buscando el 
                    %minimo, guarda el valor en una variable 
                    %min, ademas guarda en index todos los indices donde
                    %encuentre ese minimo.  
        if x_k(i) < min
            index = [];
            min = x_k(i);
            index(size(index) + 1) = i;
        elseif x_k(i) == min
            index(size(index) + 1) = i;
        end
    end
    
    s = size(index);
    if s(2) > 1 %verifica si hay varios indices con el mismo minimo, y si 
                %encuentra hace el metedo para evitar ciclaje 
        n = n + 1;
        s = index(n);
        d = IB(s);
        Y_n = inv(B)*A(:,d);
        index = razon_minima(Y_n, Y_k, B, A, IB, n);
    end
    
    return
%    [mx_k, index] = min(x_k)
end