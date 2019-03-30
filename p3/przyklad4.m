k = 20;
f = @(x) exp(-x/2);
Q = zeros(1,k);
tic;
for n = 1:k
    Q(n) = nPointLaguerre(n,f);
end
toc;
Q = real(Q);
er = abs(Q - 4/6);
figure
xlabel('\itn', 'FontSize', 35);
ylabel('\int_0^\infty\ite\rm^-^x\cdot \itf\rm(x)\it dx', 'FontSize', 35);
title('\rm\itf\rm(x) = \ite\rm^-^x^\\^2', 'FontSize', 25);
hold on
grid on
scatter(1:k, Q, '*r')
fplot(4/6,':b')
legend('\itn\rm-punktowa kwadratura','dok³adna wartoœæ', 'Location', 'southeast')
hold off