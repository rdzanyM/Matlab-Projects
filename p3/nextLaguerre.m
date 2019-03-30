function [ L3, L2 ] = nextLaguerre( L1, L2 )
%NEXTLAGUERRE(Ln, Ln1) Z dwoch kolejnych wielomianow Laguerre'a tworzy
%kolejny i zwraca go razem z wiekszym z podanych wielomianow.
k = length(L1);
L3 = zeros(1, k+2);
L3 = L3 + [(2*k+1)*L2, 0] - [k*L1, 0, 0];
L3 = L3 - [0,L2];
L3 = L3/(k+1);
end

