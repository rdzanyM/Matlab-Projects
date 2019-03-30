function [ cx ] = Diag3Cmplx( ca, cb, cc, cy, x0, itMax )
%DIAG3CMPLX rozwiazuje iteracyjnie uklad rownan C * cx = cy, gdzie C jest macierza
%trojdiagonalna o przekatnych ca(górna), cb(srodkowa), cc(dolna).
%x0 jest przyblizeniem poczatkowym.
%itMax(domyslnie 1e4) jest maksymaln¹ liczb¹ iteracji (minimum 1)

function [ vec ] = cxCheck
%liczy blad wyniku (C*cx-cy) bez tworzenia macierzy C
    vec = cb.*cx;
    vec(1:n-1) = vec(1:n-1) + ca.*cx(2:n);
    vec(2:n) = vec(2:n) + cc.*cx(1:n-1);
    vec = vec - cy;
end
function xkMake
%Z wektora x(k) tworzy wektor x(k+1)
%(wyznaczajac kolejne wspolrzedne x(k+1) korzystamy z juz wyznaczonych)
    z = xk;
    xk(1)       = 1/b(1) * (v(1)-a(1)*xk(2)+e(1)*xk(n+1)+d(1)*xk(n+2));
    for i = 2:n-1
        xk(i)   = 1/b(i) * (v(i)-c(i-1)*xk(i-1)-a(i)*xk(i+1)+f(i-1)*xk(n+i-1)+e(i)*xk(n+i)+d(i)*xk(n+i+1));
    end
    xk(n)       = 1/b(n) * (v(n)-c(n-1)*xk(n-1)+f(n-1)*xk(2*n-1)+e(n)*xk(2*n));
    xk(n+1)     = 1/b(1) * (v(n+1)-e(1)*xk(1)-d(1)*xk(2)-a(1)*xk(n+2));
    for i = 2:n-1
        xk(i+n) = 1/b(i) * (v(i+n)-f(i-1)*xk(i-1)-e(i)*xk(i)-d(i)*xk(i+1)-c(i-1)*xk(i+n-1)-a(i)*xk(i+n+1));
    end
    xk(2*n)     = 1/b(n) * (v(2*n)-f(n-1)*xk(n-1)-e(n)*xk(n)-c(n-1)*xk(2*n-1));       
end
if nargin < 5
    disp("Za malo argumentow.");
    return;
end
if nargin > 6
    disp("Za duzo argumentow.");
    return;
end
if all(real(cb)) == 0
    disp("Metoda niezbiezna.")
    return;
end
n = length(cb);
if n == 0 || any(size(ca) ~= [n-1,1]) || any(size(cc) ~= [n-1,1]) || any(size(cy) ~= [n,1]) || any(size(x0) ~= [n,1]) || any(size(cb) ~= [n,1])
    disp("Nieprawidlowe wymiary wektorow");
    return;
end
if nargin == 5
    itMax = 1e4;
end
it = 0;
if n < 2
    cx = cy/cb;
else
    a = real(ca);
    b = real(cb);
    c = real(cc);
    d = imag(ca);
    e = imag(cb);
    f = imag(cc);
    v = [real(cy);imag(cy)];
    xk = [real(x0);imag(x0)];
    z = xk;
    xkMake;
    it = it + 1;
    while all(isfinite(xk)) && norm(xk - z) > 2*eps(norm(xk)) && it < itMax
        xkMake;
        it = it + 1;
    end
    cx = complex(xk(1:n), xk(n+1:2*n));
end
if ~all(isfinite(cx)) || (norm(cxCheck)>1e3 && nargin==5)
    disp("Metoda niezbiezna dla podanego x0.");
    disp("Liczba iteracji: " + it);
    clearvars;
    return;
end
if n<20
    disp(newline + "cx = ");
    disp(cx);
    disp("C*cx-cy = ");
    disp(cxCheck);
end
disp("Blad: ||C*cx-cy|| = " + norm(cxCheck));
disp("Liczba iteracji: " + it);
end

