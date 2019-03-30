function [ i ] = compositeSimpson( f, a, b, n )
%compositeSimpson liczy calke a-b zlozona kwadratura simpsona z podzialem
%na n podprzedzialow.
if nargin < 4
    n=1e5;
end
h = (b-a)/n;
x1 = linspace(a+h,b-h,n/2);
x2 = linspace(a+2*h,b-2*h,n/2-1);
i = f(a)+f(b)+4*sum(f(x1))+2*sum(f(x2));
i = i*h/3;
end

