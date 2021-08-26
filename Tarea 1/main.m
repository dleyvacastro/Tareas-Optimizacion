% Input del problema:
mode = 1; % 0 - Silencioso 1 - Verbose.
problem_mode = 0; % 0 - min 1 - max.

%Problema 1 óptimo finito 
% A = [3,4,1,0;3,2,0,1]
% c = [2,4,0,0]
% b = [4;1]

%Problema 2 óptimo finito 
% A = [2,5,1,0;5,7,0,1]
% c = [6,2,0,0]
% b = [3;6]

%Problema 1 óptimo no-finito 
% A = [1,-2,1,0; -1,1,0,1]
% c = [-1,-3,0,0]
% b = [4;3]

%Problema 2 óptimo no-finito 
% A = [-1,1,1,0;1,-2,0,1]
% c = [-2,-1,0,0]
% b = [1;2]

%Problema 1 óptimos multiples 
% A = [2,1,1,0;1,2,0,1]
% c = [-1,-1/2,0,0]
% b = [4;3]

%Problema 2 óptimo multiples 
% A = [2,4,1,0;4,3,0,1]
% c = [-1,-2,0,0]
% b = [12;16]

%Problema 1 sin solución factible 
% A = [1,5,-1,0;1,5,0,1]
% c = [1,2,0,0]
% b = [5;1]

%Problema 2 sin solución factible
A = [3,9,-1,0;1,9,0,1]
c = [1,2,0,0]
b = [5;1]

if problem_mode
    c = -c;
end

x_opt = simplex(A,b,c, mode);
% Output:
disp('Solucion Optima:')
disp(x_opt)