function x_opt = simplex(A, b, c, mode)
    % Fase I
    [b, I_b, I_n] = fases(A, b, mode);
    if b % En dado caso de que exista solucion factible.
        % Fase II
        [x_opt] = iteration(A, b, c, I_b, I_n, mode);
        
    end
end