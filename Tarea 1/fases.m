function [b, I_b, I_n] = fases(A, b, mode)
    %Input:
    % Matriz A, Lado derecho b, Booleano indicando el modo: 0 - Silencioso 1 - Verbose mode.
    %Output:
    % Booleano indicando si se debe continuar a la fase 2 b, Indices de
    % v basicas I_b, Indices de v no basicas I_n.
    % Funcion que obtiene bases para la solucion factible.
    [n, m] = size(A);
    % Creacion de variables artificiales
    V_a = eye(n);
    I_a = [m+1:n+m];
    A = [A V_a];

    [n, m] = size(A);

    c = [zeros(1,m-n),ones(1,n)]; % Crecion de vector de coeficientes c 
    % Ajuste de variables basicas y no basicas
    I_b=[m-1,m];
    I_n = [1:m-2];

    if mode
        disp('Fase I')
        disp('A:')
        disp(A)
        disp('c:')
        disp(c)
        disp('I_b:')
        disp(I_b)
        disp('I_n:')
        disp(I_n)
        disp('I_a:')
        disp(I_a)
    end

    [x_hat, I_b, I_n] = iteration(A, b, c, I_b, I_n, mode); % Llamado de funcion iteration para metodo simplex Fase I.

    % Retiro de variables artificiales de las variables no basicas.
    I_n = setdiff(I_n, I_a);

    if any(x_hat(I_a) ~= 0) % Comprobacion del valor de las variables artificiales en la solucion factible.
        disp('No tiene solucion factible: Variables artificiales distintas de cero');
        b = false; % Variable encargada de detener la ejecucion del programa.
    elseif any(ismember(I_a, I_b)) % Comprobacion de variables artificiales en la base
        % Retiro de variables artificiales de la base
        [I_bn, I_bm] = size(I_b);
        I_b = setdiff(I_b, I_a);
        [a, b] = size(I_b);
        for i = 1:(I_bm-b)
            randomIndex = randi(length(I_n), 1);
            nb = I_n(randomIndex);
            I_n(randomIndex) = [];
            I_b = [I_b, nb];
        end
        if mode
            disp('Fase 2')
            disp('Variables basicas: ');
            disp(I_b)
            disp('Variables no basicas: ');
            disp(I_n)
        end
    end

end

