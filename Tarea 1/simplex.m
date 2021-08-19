% I_b = [1,2]
% I_n = [3,4]
% 
% A = [1,2,1,0;0,1,0,1]
% c = [1,1,0,0]
% b = [4;1]

A = [-1,2,-1,0;1,1,0,1]
b = [2;6]

% A = [-1,2,1,0;-1,1,0,-1]
% b = [2;3]

fases(A, b)

%iteration(A, b, c, I_b, I_n)
% 
% [I_bn, I_nn] = iteration(A,b,c,I_b,I_n)
% disp('iteracion 2-------')
% [I_bnn, I_nnn] = iteration(A,b,c,I_bn,I_nn)
% disp('iteracion 3-------')
% [I_bnnn, I_nnnn] = iteration(A,b,c,I_bnn,I_nnn)
% 
