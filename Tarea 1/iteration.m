function iteration(A, b, c, I_b, I_n)
disp('Inicio Iteracion')
disp('Paso 1: Resolver el sistema de ecuaciones')
B = A(:, I_b)
[n,m] = size(A);
[n_I_b,m_I_b] = size(I_b);
X_b = inv(B)*b

x_hat = zeros(1,m);
for i = 1:m_I_b
    x_hat(I_b(i)) = X_b(i); 
end
% x_hat = [0,0,0,0]
% x_hat(I_b(1)) = X_b(1)
% x_hat(I_b(2)) = X_b(2)

z0 = c(I_b)*X_b

% Costos reducidos
disp('Paso 2: Encontrar Costos reducidos')
C_j = [c(I_n)];
Z_j = [c(I_b)]*inv(B)*A(:, I_n);
C_j_ = C_j-Z_j
if any(C_j_ < 0)
    disp('Paso 3: Cambio de base')
    V_candidata = I_n(find(C_j_ == min(C_j_)));
    disp(['x_',num2str(V_candidata), ' entrará a la base.'])
    % Criterio de la razon minima
    Y_k = inv(B)*A(:,V_candidata)
    a = razon_minima(X_b, Y_k)
    r = I_b(a)
    disp(['x_',num2str(r), ' saldra de la base.'])
    
    I_b(find(I_b == r)) = V_candidata;
    I_b = sort(I_b)
    
    I_n(find(I_n == V_candidata)) = r;
    I_n = sort(I_n)
    
    %llamado recursivo
    iteration(A, b, c, I_b, I_n)
    
else
    disp('Solucion optima: ')
    x_hat
end

end