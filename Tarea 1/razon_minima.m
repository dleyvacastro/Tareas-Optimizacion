function index = razon_minima(X_b, Y_k, B, A, IB, n, mode)
    s = size(Y_k);
    for i = 1:s(1) % convierte todos los elementos negativos de Y_k en 0 
        if Y_k(i) < 0
            Y_k(i) = 0;
        end
    end
    x_k = X_b./Y_k; %calcula el arreglo bi/Yik
    if mode
        disp('Razon minima: ');
        disp(x_k);
    end
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
    
    if mode
        disp('Minimo: ');
        disp(min);
    end
    
    if mode
        disp('Indices del minimo en I_n: ');
        disp(index);
    end
    
    s = size(index);
    if s(2) > 1 %verifica si hay varios indices con el mismo minimo, y si 
                %encuentra hace el metedo para evitar ciclaje 
        if mode
            disp('Entra a ciclaje');            
        end
        n = n + 1;
        s = index(n);
        d = IB(s);
        Y_n = inv(B)*A(:,d);
        index = razon_minima(Y_n, Y_k, B, A, IB, n);
    end
    
    return
%    [mx_k, index] = min(x_k)
end