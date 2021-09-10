function la = seccionaurea(a, b, la, u, p)
%     p = 0.618;
%     l = a + (1- p)*(b - a);
%     u = a + (p)*(b-a);

    
    if b - a < 0.1
        disp(la);
        return
        disp(1);
    else
        if f2(la) > f2(u)
            a = la;
            la = u;
            u = a + p*(b -a);
            seccionaurea(a, b, la, u, p);
        else
            u = la;
            b = u;
            la = a + (1 - p)*(b - a);
            seccionaurea(a, b, la, u, p);
        end
    end
end