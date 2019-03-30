%skrypt zbiera dane i na podstawie ich tworzy funkcje
%potrzebne do narysowania wykresow porownania czasu wykonania w skrypcie Draw.
%Zajmuje to doœæ du¿o czasu (ok. 10min), wiec tworzone tutaj funkcje
%sa tez zapisane w pliku saved.mat
nspv = zeros(159,1);
spv = zeros(159,1);
for n = 2:160
    A = diag(ones(1,n)*4) + diag(ones(1,n-1),1) + diag(ones(1,n-1),-1);
    f = @() qrGivens(A,1);
    nspv(n-1) = timeit(f);
    f = @() qrGivens(A);
    spv(n-1) = timeit(f);
end
sp = fit((2:160)', spv, 'smoothingspline');
nsp = fit((2:160)', nspv, 'smoothingspline');
clear('spv', 'nspv');

stdv = zeros(40,1);
sftv = zeros(40,1);
for n = 1:40
    f = @() eigQRG(n);
    stdv(n) = timeit(f);
    f = @() eigQRG(n, 'shift');
    sftv(n) = timeit(f);
end
std = fit((1:40)', stdv, 'smoothingspline');
sft = fit((1:40)', sftv, 'smoothingspline');
clear('stdv', 'sftv');
clfv = zeros(40,1);
matv = zeros(40,1);
for n = 1:200
    f = @() eigQRG(n, 'closedForm');
    clfv(n) = timeit(f);
    A = diag(ones(1,n)*4) + diag(ones(1,n-1),1) + diag(ones(1,n-1),-1);
    f = @() eig(A);
    matv(n) = timeit(f);
end
clf = fit((1:200)', clfv, 'smoothingspline');
mat = fit((1:200)', matv, 'smoothingspline');
clear('clfv', 'matv');

farv = zeros(30,1);
clsv = zeros(10,1);
for n = 1:10
    A = diag(ones(1,n)*40) + diag(ones(1,n-1),1) + diag(ones(1,n-1),-1);
    f = @() eigQRG(n, 'shift', A);
    clsv(n) = timeit(f);
end
for n = 1:30
    A = diag(ones(1,n)*4) + diag(ones(1,n-1)*2,1) + diag(ones(1,n-1)*2,-1);
    f = @() eigQRG(n, 'shift', A);
    farv(n) = timeit(f);
end
far = fit((1:30)', farv, 'smoothingspline');
cls = fit((1:10)', clsv, 'smoothingspline');
clear('farv', 'clsv');






