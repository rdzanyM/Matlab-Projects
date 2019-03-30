%dodatkowo podaje czas wykonania funkcji
disp(newline + "nasza metoda:");
tic;
Diag3Cmplx(ca, cb, cc, cy, x0);
toc;
disp(newline + "matlab sparse:");
cs = spdiags([[ca;0],cb,[cc;0]],[1,0,-1],n,n);
tic;
cs\cy;
toc;