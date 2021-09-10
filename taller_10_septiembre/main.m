a = -3;
b = 3;
p = 0.618;
la = a + (1- p)*(b - a);
u = a + (p)*(b-a);


y = seccionaurea(a, b, la, u, p, 1);

disp(y);