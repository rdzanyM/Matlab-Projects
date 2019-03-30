function [ v ] = eigQRG( n, method, A )
%eigQRG(n,method,A) Zwraca wektor wszystkich wartoœci w³asnych macierzy A,
%wyliczajac go metoda QR, u¿ywajac do rozkladu QR funkcji qrGivens.
%Argumenty method i A s¹ opcjonalne
if nargin > 3 || nargin < 1 || n < 1
    disp('niepoprawne argumenty');
    return;
end
if nargin < 3
    A = diag(ones(1,n)*4) + diag(ones(1,n-1),1) + diag(ones(1,n-1),-1);
end
if nargin < 2
    method = 'standard';
end

switch method 
    case 'standard'
        if length(A) > 1
            while norm(diag(A,-1)) > 10*eps(norm(diag(A)))
                [Q,R] = qrGivens(A);
                A = R*Q;
            end
        end
        v = diag(A);   
    case 'shift'
        v = zeros(n,1);
        for i = n:-1:2
            while abs(A(i,i-1)) > 10*eps(A(i,i))
                [Q,R] = qrGivens(A);
                A = R*Q;
            end
            v(i) = A(i,i);
            A = A(1:i-1,1:i-1);
        end
        v(1) = A;   
    case 'closedForm'
        if length(A)==1
            v = A(1,1);
        else
            v = A(1,1) - 2*sqrt(abs(A(1,2)*A(2,1)))*cos((1:n)*pi/(n+1))';
        end
    otherwise
        disp('niepoprawne argumenty');
end

