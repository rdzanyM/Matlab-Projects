if exist('n','var') == 0
    n=20;
end
if exist('Z','var') == 0
    Z = zeros(2,2,2);
    Z(:,:,1) = [0,10;10,20];
    Z(:,:,2) = [10,20;0,10];
end

tic;
M = makeM(n,f,Z);
[B, sk] = tab(f,M,Z);
toc;

if(n<=8)
    B = table(B(:,1),B(:,2),B(:,3),B(:,4),B(:,5));
    B.Properties.VariableNames = {'x' 'y' 'f' 'w' 'blad'};
    disp(B);
    if(n<=4)
        disp("Macierz wspolczynnikow: ");
        disp(M);
    end
end
disp("Blad sredniokwadratowy w srodkach ciezkosci: " + sk);