function [ B, sk ] = tab( f,M,Z )
%TAB tablicuje funkcje w srodkach ciezkosci i liczy blad sredniokwadratowy
n = size(M,3);
nx = zeros(n+1);
nx(:,1) = linspace(Z(1,1,1),Z(2,1,1),n+1);
nx(:,n+1) = linspace(Z(1,2,1),Z(2,2,1),n+1);
for i = 1:n+1
    nx(i,:) = linspace(nx(i,1),nx(i,n+1),n+1);
end
ny = zeros(n+1);
ny(:,1) = linspace(Z(1,1,2),Z(2,1,2),n+1);
ny(:,n+1) = linspace(Z(1,2,2),Z(2,2,2),n+1);
for i = 1:n+1
    ny(i,:) = linspace(ny(i,1),ny(i,n+1),n+1);
end

B = zeros(2*n*n,5);
for i = 1:n
    for j = 1:n
        k = 2*(n*(i-1)+j)-1;
        x = (nx(i,j)+nx(i+1,j)+nx(i+1,j+1))/3;
        y = (ny(i,j)+ny(i+1,j)+ny(i+1,j+1))/3;
        B(k,1) = x;
        B(k,2) = y;
        B(k,3) = f(x,y);
        B(k,4) = valueW(x,y,M(:,1,i,j));
        
        k = 2*(n*(i-1)+j);
        x = (nx(i,j)+nx(i,j+1)+nx(i+1,j+1))/3;
        y = (ny(i,j)+ny(i,j+1)+ny(i+1,j+1))/3;
        B(k,1) = x;
        B(k,2) = y;
        B(k,3) = f(x,y);
        B(k,4) = valueW(x,y,M(:,2,i,j));
    end
end
B(:,5) = B(:,3) - B(:,4);
sk = sqrt(sum(B(:,5).^2)/size(B,1));
end

