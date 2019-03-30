%Macierz C ma wymiary n*n
if exist('n','var') == 0
    n=1e4;
end
ca = complex(20*rand(n-1,1)-10, 20*rand(n-1,1)-10);
cb = complex(50*rand(n,1)+50,   20*rand(n,1)-10);   %Gwarancja zbieznosci
cc = complex(20*rand(n-1,1)-10, 20*rand(n-1,1)-10);
cy = complex(20*rand(n,1)-10,   20*rand(n,1)-10);
x0 = complex(20*rand(n,1)-10,   20*rand(n,1)-10);
if n<20
    c = diag(ca, 1) + diag(cb) + diag(cc,-1);
    disp('C = ');
    disp(c);
    disp('cy = ');
    disp(cy);
    disp('x0 = ');
    disp(x0);
end