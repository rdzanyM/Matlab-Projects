function [ x, y, z ] = rk4( f, g, y0, z0, a, b, n )
%rozwiazuje uklad rownan rozniczkowych {y'=f(x,y,z); z'=g(x,y,z)} stosujac
%metode Rungego-Kutty rzêdu 4
%y,z - funkcje (x)
%x - przedzial a-b
%n - liczba punktów
if nargin < 7
    n = 100;
end
h = (b-a)/(n-1);
y = zeros(n,1);
z = zeros(n,1);
y(1) = y0;
z(1) = z0;

for i = 1:n-1
    x = a + (i-1)*h;
    k1 = h*f(x,y(i),z(i));
    l1 = h*g(x,y(i),z(i));
    k2 = h*f(x+h/2,y(i)+k1/2,z(i)+l1/2);
    l2 = h*g(x+h/2,y(i)+k1/2,z(i)+l1/2);
    k3 = h*f(x+h/2,y(i)+k2/2,z(i)+l2/2);
    l3 = h*g(x+h/2,y(i)+k2/2,z(i)+l2/2);
    k4 = h*f(x+h,y(i)+k3,z(i)+l3);
    l4 = h*g(x+h,y(i)+k3,z(i)+l3);
    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
    z(i+1) = z(i) + (l1 + 2*l2 + 2*l3 + l4)/6;
end
x = (a:h:b)';

end

