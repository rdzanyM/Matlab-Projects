%tabele zwracanych wartosci wlasnych dla roznych macierzy i metod.
disp(newline + "Macierz z tematu");
A = diag(ones(1,10)*4) + diag(ones(1,9),1) + diag(ones(1,9),-1);
st = eigQRG(10);
sh = eigQRG(10, 'shift');
cl = eigQRG(10, 'closedForm');
ei = eig(A);
T = table(st,sh,cl,ei);
T.Properties.VariableNames = {'standard', 'shift', 'closedForm', 'eig'};
disp(T);

disp(newline + "Macierz z tematu/1e15");
A = diag(ones(1,10)*4) + diag(ones(1,9),1) + diag(ones(1,9),-1);
st = eigQRG(10, 'standard', A);
sh = eigQRG(10, 'shift', A);
cl = eigQRG(10, 'closedForm', A);
ei = eig(A);
T = table(st,sh,cl,ei);
T.Properties.VariableNames = {'standard', 'shift', 'closedForm', 'eig'};
disp(T);

disp(newline + "Inna macierz (o rzeczywistych wartosciach wlasnych)");
A = rand(10,10);
A = A + A';
A = hess(A);
st = eigQRG(10, 'standard', A);
sh = eigQRG(10, 'shift', A);
ei = eig(A);
T = table(st,sh,ei);
T.Properties.VariableNames = {'standard', 'shift', 'eig'};
disp(T);