function [ Q, R ] = qrGivens( A, ~ )
%[Q,R]=qrGivens(A) zwraca rozklad QR gornej macierzy Hessenberga A
%korzystajac z rotacji Givensa
if nargin > 1
    n = length(A);
    Q = diag(ones(n,1));
    for i = 1:n-1
        G = diag(ones(n,1));                    %bez macierzy sparse (do porowniania czasu)
        r = sqrt(A(i,i)^2 + A(i+1,i)^2);
        c = A(i,i)/r;
        s = A(i+1,i)/r;
        G(i,i) = c;
        G(i+1,i+1) = c;
        G(i+1,i) = -s;
        G(i,i+1) = s;
        Q = Q * G';
        A = G * A;
    end
    R = A;
    return;
end

n = length(A);
Q = diag(ones(n,1));
for i = 1:n-1
    G = sparse(diag(ones(n,1)));
    r = sqrt(A(i,i)^2 + A(i+1,i)^2);
    c = A(i,i)/r;
    s = A(i+1,i)/r;
    G(i,i) = c;
    G(i+1,i+1) = c; %szybciej ni¿ suugerowane
    G(i+1,i) = -s;
    G(i,i+1) = s;
    %I = [1:n,i+1,i];
    %J = [1:n,i,i+1];
    %V = [ones(1,i-1),c,c,ones(1,n-i-1),-s,s]; wolniej ni¿ diag
    %G = sparse(I,J,V,n,n);
    Q = Q * G';
    A = G * A;
end
R = A;
end

