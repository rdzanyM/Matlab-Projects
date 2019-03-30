function [ v ] = approximation( f, n )
%approximation zwraca wektor wspolczynnikow
% v = [a0,a1,b1,a2,...,bn]

v = zeros(1,2*n+1);
for i = 1:n
    v(2*i)   = compositeSimpson(@(x)f(x).*cos(i.*x), 0, 2*pi, 10*n) / pi;
    v(2*i+1) = compositeSimpson(@(x)f(x).*sin(i.*x), 0, 2*pi, 10*n) / pi;
end
v(1) = compositeSimpson(f, 0, 2*pi, 10*n) / (2*pi);
end

