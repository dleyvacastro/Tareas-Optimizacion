function [x_hat, I_b, I_n] = iteration(A, b, c, I_b, I_n, mode, fase)
    % Input: 
    % Matriz A, parte derecha b, vector de coeficientes c, Indices de
    % v basicas I_b, Indices de v no basicas I_n.
    % Output: Solucion Optima x_opt, Inidices de v basicas usadas I_b, Inidices
    % de v no basicas usadas I_n, Booleano indicando el modo: 0 - Silencioso 1 - Verbose mode.
    % Desarrolla los 3 pasos del metodo simplex.

    while true                      % Ciclo responsable de las iteraciones del metodo.
        if mode
            disp('Inicio Iteracion');
            disp('I_b');
            disp(I_b);
            disp('I_n');
            disp(I_n);
        end
        %Parte 1 ---------------
        B = A(:, I_b);
        [n,m] = size(A);
        [n_I_b,m_I_b] = size(I_b);
        X_b = inv(B)*b;

        x_hat = zeros(1,m);         % Ciclo responsable de la creacion de la variable x_hat.
        for i = 1:m_I_b
            x_hat(I_b(i)) = X_b(i); 
        end

        z0 = c(I_b)*X_b;

        %Parte 2 ---------------

        C_j = [c(I_n)];
        Z_j = [c(I_b)]*inv(B)*A(:, I_n);
        C_j_ = C_j-Z_j;
        
        %-----
        if mode
           disp('Paso 1: Resolver el sistema de ecuaciones');
           disp('b_hat:')
           disp(X_b)
           disp('x_hat:')
           disp(x_hat)
           disp('z0:')
           disp(z0)
           disp('Paso 2: Encontrar Costos reducidos')
           disp('C_j_')
           disp(C_j_)
        end
        %-----

        % Comprobacion de precencia de 0's o negativos en los Costos reducidos.
        if any(C_j_ == 0) && all(C_j_ >= 0) && fase 
            disp('Nota: El problema tendrá multiples Soluciones, hay ceros en C_j');
        end 

        if all(C_j_ >= 0); break; end % Condicion de salida del ciclo: ningun negativo en C_j_.

        V_candidata = I_n(find(C_j_ == min(C_j_)));
        V_candidata = V_candidata(1);

        %Parte 3 ---------------
        Y_k = inv(B)*A(:,V_candidata);
        if all(Y_k <= 0)
            disp('Nota: El problema no tendrá óptimo finito, los elementos de Y_k son menores o iguales a cero');
            x_hat = 'Óptimo no finito';
            break;
        end
        a = razon_minima(X_b, Y_k, B, A, I_b, 0, mode);
        r = I_b(a);

        % Cambio de base
        I_b(find(I_b == r)) = V_candidata;
        I_b = sort(I_b);

        I_n(find(I_n == V_candidata)) = r;
        I_n = sort(I_n);
        
        if mode
            disp('Paso 3: Cambio de base');
            disp(['x_',num2str(V_candidata), ' entrará a la base.']);
            disp(['x_',num2str(r), ' saldrá de la base.']);
        end
        
    end
    
    
    return;
end