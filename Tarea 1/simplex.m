% I_b = [1,2]
% I_n = [3,4]
% 
A = [1,2,1,0;-1,1,0,1]
c = [-2,-4,0,0]
b = [4;1]

% A = [-1,2,-1,0;1,1,0,1]
% b = [2;6]
% c = [5,-1,0,0]

% A = [-1,2,1,0;-1,1,0,-1]
% b = [2;3]

[b, I_b, I_n] = fases(A, b);
disp('Fin Fase 1')


if b
    [x_opt] = iteration(A, b, c, I_b, I_n)
end
%iteration(A, b, c, I_b, I_n)
% 
% [I_bn, I_nn] = iteration(A,b,c,I_b,I_n)
% disp('iteracion 2-------')
% [I_bnn, I_nnn] = iteration(A,b,c,I_bn,I_nn)
% disp('iteracion 3-------')
% [I_bnnn, I_nnnn] = iteration(A,b,c,I_bnn,I_nnn)
% 
