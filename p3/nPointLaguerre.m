function [ q ] = nPointLaguerre( n, f, symbolic )
%NPOINTLAGUERRE(n, f) liczy calke e^(-x)f(x)dx na przedziale [0,inf]
%n-punktowa kwadratura Gaussa-Laguerre'a. Jesli podamy dodatkowy argument
%'symbolic' to uzywa funkcji z "Symbolic Math Toolbox".
if nargin ~= 2
    if (nargin == 3 && symbolic == "symbolic")
        symbolic = true;
    else
        disp('Niepoprawne argumenty');
        return;
    end
else
    symbolic = false;
end
if(n<0 || floor(n)~=n)
    disp('Niepoprawne argumenty');
    return;
end


if symbolic
    syms s;
    p = sym2poly(laguerreL(n,s));
    C = sym(compan(p));
    x = eig(C);
else
    L = makeLaguerre(n+1);
    x = roots(fliplr(L(n+1,:)));
end
x = real(x);

v = zeros(n,1);
v(1) = 1;
if symbolic
    A = sym(zeros(n));
    for i=1:n
        for j=1:n
            A(i,j) = laguerreL(i-1,x(j));
        end
    end
else
    A = zeros(n);
    for i=1:n
        for j=1:n
            A(i,j) = pxValue(L(i,:),x(j));
        end
    end    
end


w = A\v;
w = real(w);
%w = x./((n+1).^2.*(laguerreL(n+1,x)).^2); mniejsza dok³adnoœæ
q = sum(w.*f(x));
end

