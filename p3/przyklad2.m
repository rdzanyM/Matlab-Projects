k = 20;
f = @(x) x.^5-x.^4-x.^3+x.^2+x-8;
Q = zeros(1,k);
tic;
for n = 1:k
    Q(n) = nPointLaguerre(n,f);
end
toc;
Q = real(Q);
er = abs(Q - 85);
figure
xlabel('\itn', 'FontSize', 35);
ylabel('\int_0^\infty\ite\rm^-^x\cdot \itf\rm(x)\it dx', 'FontSize', 35);
title('\rm\itf\rm(x) = x^5- x^4- x^3+ x^2+ x - 8', 'FontSize', 25);
hold on
grid on
scatter(1:k, Q, '*r')
fplot(85,':b')
legend('\itn\rm-punktowa kwadratura','dok³adna wartoœæ', 'Location', 'southeast')
hold off