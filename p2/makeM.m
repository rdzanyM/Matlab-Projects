function [ M ] = makeM( n, f, Z )
%MAKEM tworzy macierz (6 x 2 x n x n),
%ktora przechowuje wektory wspolrzednych dla wszystkich trojkatow.
if (length(n) ~= 1 || floor(n) ~= n || n < 1 || ~isequal(size(Z),[2,2,2]))
    disp('Niepoprawne argumenty');
    return;
end
x = norm([Z(1,1,1),Z(1,1,2)]-[Z(1,2,1),Z(1,2,2)]);
y = norm([Z(1,1,1),Z(1,1,2)]-[Z(2,1,1),Z(2,1,2)]);
e = 100*eps(min([x,y]));
if (max([x-norm([Z(2,1,1),Z(2,1,2)]-[Z(2,2,1),Z(2,2,2)]), y-norm([Z(2,2,1),Z(2,2,2)]-[Z(1,2,1),Z(1,2,2)]), norm([Z(1,1,1),Z(1,1,2)]-[Z(2,2,1),Z(2,2,2)])-norm([Z(1,2,1),Z(1,2,2)]-[Z(2,1,1),Z(2,1,2)])]) > e)
    disp('To nie jest kwadrat.');
    return;
end
if (x-y > e)
    disp('To nie jest kwadrat.');
    disp('To jest prostokat.');
    s = 0;
    while (~strcmp(s,'T') && ~strcmp(s,'N'))
        s = input('Czy chcesz kontynuowac (T/N)','s');
    end
    if (s == 'N')
        return;
    end
end

X = zeros(2*n+1);
X(:,1)     = linspace(Z(1,1,1),Z(2,1,1),2*n+1);
X(:,2*n+1) = linspace(Z(1,2,1),Z(2,2,1),2*n+1);
for i = 1:2*n+1
    X(i,:) = linspace(X(i,1),X(i,2*n+1),2*n+1);
end
Y = zeros(2*n+1);
Y(:,1)     = linspace(Z(1,1,2),Z(2,1,2),2*n+1);
Y(:,2*n+1) = linspace(Z(1,2,2),Z(2,2,2),2*n+1);
for i = 1:2*n+1
    Y(i,:) = linspace(Y(i,1),Y(i,2*n+1),2*n+1);
end

M = zeros(6,2,n,n);
A = ones(6);

%Macierz A mo¿e byæ bardzo Ÿle uwarunkowana. Otrzymany wektor
%wspó³czynników wsp' mo¿e siê wtedy znacznie ró¿niæ od dok³adnego wektora
%wspó³czynników wsp, ale nie ma to znaczenia, bo stworzony na podstawie
%tych wspó³czynników wielomian w' przecina funkcjê f w okreœlonych wêz³ach
%przy u¿ywanej precyzji obliczeñ.
warning('off','MATLAB:nearlySingularMatrix');
%Mo¿naby zawsze u¿ywaæ pinv, ale jest to wolniejsze.

%przechodzimy po n^2 kwadratach i dzielimy je na trojkaty
%        #-----#----#
%        |  \ gorny |
%        #     #    #    # - wierzcholek
%        | dolny  \ |
%        #-----#----#
for i = 1:n
    for j = 1:n
        k = 2*i;
        l = 2*j;
        
        %dolny trojkat
        nodes =[[ X( k-1, l-1 ) ,Y( k-1, l-1 ) ];
                [ X(  k , l-1 ) ,Y(  k , l-1 ) ];
                [ X( k+1, l-1 ) ,Y( k+1, l-1 ) ];
                [ X(  k ,  l  ) ,Y(  k ,  l  ) ];
                [ X( k+1,  l  ) ,Y( k+1,  l  ) ];
                [ X( k+1, l+1 ) ,Y( k+1, l+1 ) ]];
        A(:,2:6) = [nodes,nodes.^2,nodes(:,1).*nodes(:,2)];
        fn = f(nodes(:,1),nodes(:,2));
        if(det(A)~=0)
            M(:,1,i,j) = A\fn;
        else
            M(:,1,i,j) = pinv(A)*fn;
        end
        
        %gorny trojkat
        nodes =[[ X( k-1, l-1 ) ,Y( k-1, l-1 ) ];
                [ X( k-1,  l  ) ,Y( k-1,  l  ) ];
                [ X( k-1, l+1 ) ,Y( k-1, l+1 ) ];
                [ X(  k ,  l  ) ,Y(  k ,  l  ) ];
                [ X(  k , l+1 ) ,Y(  k , l+1 ) ];
                [ X( k+1, l+1 ) ,Y( k+1, l+1 ) ]];
        A(:,2:6) = [nodes,nodes.^2,nodes(:,1).*nodes(:,2)];
        fn = f(nodes(:,1),nodes(:,2));
        if(det(A)~=0)
            M(:,2,i,j) = A\fn;
        else
            M(:,2,i,j) = pinv(A)*fn;
        end
    end
end
end

