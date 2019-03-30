%Macierz C ma wymiary n*n
if exist('n','var') == 0
    n=1e4;
end
ca = ones(n-1,1)*(1+1i);
cc = ca + ones(n-1,1);
cb = ones(n,1);
cy = cb*(1+2i);
cb = cb*(5+2i);
x0 = cy;
if n<20
    c = diag(ca, 1) + diag(cb) + diag(cc,-1);
    disp('C = ');
    disp(c);
    disp('cy = ');
    disp(cy);
    disp('x0 = ');
    disp(x0);
end