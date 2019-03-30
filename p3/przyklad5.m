k = 20;
Q = zeros(1,k);
tic;
for n = 1:k
    Q(n) = nPointLaguerre(n,@sqrt);
end
toc;
Q = real(Q);
er = abs(Q - sqrt(pi)/2);
figure
xlabel('\itn', 'FontSize', 35);
ylabel('\int_0^\infty\ite\rm^-^x\cdot \itf\rm(x)\it dx', 'FontSize', 35);
title('\rm\itf\rm(x) = \surdx', 'FontSize', 25);
hold on
grid on
scatter(1:k, Q, '*r')
fplot(sqrt(pi)/2,':b')
legend('\itn\rm-punktowa kwadratura','dok³adna wartoœæ')
hold off