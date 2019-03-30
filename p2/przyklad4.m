f = @(x,y) log(x+1)./log(y+2);
przyklad;
figure
title('log(x+1)/log(y+2)')
draw(Z,M,f);