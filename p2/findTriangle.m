function [ w1, w2, w3 ] = findTriangle( x, y, Z, n )
%FINDTRIANGLE wylicza polozenie trojkata, w ktorym znajduje sie punkt
%(x,y), zwraca odpowiednie indeksy macierzy M

dx1 = (Z(1,2,1) - Z(1,1,1))/n;
dy1 = (Z(1,2,2) - Z(1,1,2))/n;
dx2 = (Z(2,1,1) - Z(1,1,1))/n;
dy2 = (Z(2,1,2) - Z(1,1,2))/n;

%znajdujemy kolumne
%wyszukiwanie binarne
bg = 1;
en = n+1;
while(en-bg > 1)
    p = floor((en+bg)/2);
    if (p == bg)
        p = p + 1;
    end
    if (norm([Z(1,1,1)+dx1*(p-2),Z(1,1,2)+dy1*(p-2)]-[x,y]) > norm([Z(1,1,1)+dx1*p,Z(1,1,2)+dy1*p]-[x,y]))
        bg = p;
    else
        en = p;
    end
end
w3 = bg;

%znajdujemy wiersz
%wyszukiwanie binarne
bg = 1;
en = n+1;
while(en-bg > 1)
    p = floor((en+bg)/2);
    if (p == bg)
        p = p + 1;
    end
    if (norm([Z(1,1,1)+dx2*(p-2),Z(1,1,2)+dy2*(p-2)]-[x,y]) > norm([Z(1,1,1)+dx2*p,Z(1,1,2)+dy2*p]-[x,y]))
        bg = p;
    else
        en = p;
    end
end
w2 = bg;

%wybieramy trojkat
if norm([Z(1,1,1)+dx1*w3+dx2*(w2-1),Z(1,1,2)+dy1*w3+dy2*(w2-1)]-[x,y]) < norm([Z(1,1,1)+dx1*(w3-1)+dx2*w2,Z(1,1,2)+dy1*(w3-1)+dy2*w2]-[x,y]) 
    w1 = 2;
else
    w1 = 1;
end
end

