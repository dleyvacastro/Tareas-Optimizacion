% Input del problema:
mode = 1;
A = [1,2,1,0;-1,1,0,1]
c = [-2,-4,0,0]
b = [4;1]

x_opt = simplex(A,b,c, mode)
% Output:
disp('Solucion Optima:')
disp(x_opt)