function [ ] = draw( Z, M, f, i )
%DRAW rysuje na jednym wykresie funkcje f i w dla punktow o wspolrzednych z przedzialu i.
%Funkcja w jest rysowana w 2500 rownoodleglych punktach.
%Wartoœci w dla punktów nale¿¹cych do kwadratu Z s¹ rysowane na niebiesko, a dla pozosta³ych na czerwono.
n = size(M,3);
dx1 = (Z(1,2,1) - Z(1,1,1))/n;
dy1 = (Z(1,2,2) - Z(1,1,2))/n;
dx2 = (Z(2,1,1) - Z(1,1,1))/n;
dy2 = (Z(2,1,2) - Z(1,1,2))/n;

ma = max(max(max(Z)));
mi = min(min(min(Z)));
m = abs(ma)+ abs(mi);
if nargin <4
    i = [mi-m/10, ma+m/10];
end

hold on
xlabel('x');
ylabel('y');
p = 50;
d = (i(2)-i(1))/(p-1);
for x = i(1):d:i(2)
    for y = i(1):d:i(2)
        if ((norm([Z(1,1,1)+dx1,Z(1,1,2)+dy1]-[x,y]) > norm([Z(1,1,1)-dx1,Z(1,1,2)-dy1]-[x,y]))||(norm([Z(1,1,1)+dx2,Z(1,1,2)+dy2]-[x,y]) > norm([Z(1,1,1)-dx2,Z(1,1,2)-dy2]-[x,y]))||(norm([Z(2,2,1)+dx1,Z(2,2,2)+dy1]-[x,y]) < norm([Z(2,2,1)-dx1,Z(2,2,2)-dy1]-[x,y]))||(norm([Z(2,2,1)+dx2,Z(2,2,2)+dy2]-[x,y]) < norm([Z(2,2,1)-dx2,Z(2,2,2)-dy2]-[x,y])))
            c = 'red';
        else
            c = 'blue';
        end
        [mi,mj,mk] = findTriangle(x,y,Z,n);
        line(x, y, valueW(x,y,M(:,mi,mj,mk)), 'LineStyle','none', 'Marker','.', 'Color',c)
    end
end
view(30,40)
fmesh(f,i)
hold off
end

