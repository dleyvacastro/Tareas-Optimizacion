function v = seccionaurea(a, b, la, u, p, i)
%     p = 0.618;
%     l = a + (1- p)*(b - a);
%     u = a + (p)*(b-a);

    i
    a
    b
    la
    u
    f2(la)
    f2(u)
    disp('-------------------------------------')
    if b - a <= 0.01
        v = la;
    else
        if f2(la) >= f2(u)
            a = la;
            la = u;
            u = a + p*(b -a);
            v = seccionaurea(a, b, la, u, p, i + 1);
        else
            b = u;
            u = la;
            la = a + (1 - p)*(b - a);
            v = seccionaurea(a, b, la, u, p, i + 1);
        end
    end
    return 
end