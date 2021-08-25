% Input del problema:
mode = 0; % 0 - Silencioso 1 - Verbose.
problem_mode = 1; % 0 - min 1 - max.
A = [-1,1,1,0;1,-2,0,1]
c = [2,1,0,0]
if problem_mode
    c = -c;
end
b = [1;2]

x_opt = simplex(A,b,c, mode);
% Output:
disp('Solucion Optima:')
disp(x_opt)