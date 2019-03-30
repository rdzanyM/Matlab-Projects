f = @(x,y) x.*exp(-x.^2-y.^2);
if exist('n','var') == 0
    n=10;
end
t = 'x / e^(^x^\^^2^+^y^\^^2^)';
Z(:,:,1) = [-2.5,2.5;-2.5,2.5];
Z(:,:,2) = [2.5,2.5;-2.5,-2.5];
M = makeM(n,f,Z);
figure
title(t)
draw(Z,M,f)
Z(:,:,1) = [-2,0;0,2];
Z(:,:,2) = [0,2;-2,0];
M = makeM(n,f,Z);
figure
title(t)
draw(Z,M,f)
Z(:,:,1) = [-3,0;0,3];
Z(:,:,2) = [0,3;-3,0];
M = makeM(n,f,Z);
figure
title(t)
draw(Z,M,f)