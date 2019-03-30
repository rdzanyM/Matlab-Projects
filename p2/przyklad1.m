f = @(x,y) 3+7.*x.^2+4.*y-3.*x.*y;
przyklad;
figure
title('3 + 7x + 4y - 3xy')
draw(Z,M,f);