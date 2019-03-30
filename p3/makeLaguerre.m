function [ L ] = makeLaguerre( n )
%MAKELAGUERRE(n) zwraca macierz n x n t.z k-ty wiersz macierzy L to k-1
%wielomian Laguerre'a.
L = zeros(n);
L1 = 1;
L2 = [1,-1];
for i = 1:n
    L(i,1:i) = L1;
    [L2, L1] = nextLaguerre(L1,L2);
end
end

