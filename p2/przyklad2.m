f = @(x,y) x.*sin(x)+10.*cos(y);
przyklad;
figure
title('xsin(x)+10cos(y)')
draw(Z,M,f);