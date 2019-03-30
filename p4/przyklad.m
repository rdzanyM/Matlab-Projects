n = 200;          %stopien aproksymacji
m = 200;        %liczba punktow(do wykresow i tablicowania)
m = linspace(0,2*pi,m)';
f = @(x) 2.*sin(x).*cos(x);
v = approximation(f, n);
fm = f(m);
am = apxValue(v,m);
em = fm-am;
T = table(m,fm,am,em);
T.Properties.VariableNames = {'x', 'f', 'a', 'blad'};
disp(f);
disp(T);
figure
subplot(2,3,1)
hold on
grid on
xlabel('\itx', 'FontSize', 20);
ylabel('\itf(x)', 'FontSize', 20);
title('\rm\itf\rm(x) = 2\cdot\itsin\rm(x)\cdot\itcos\rm(x)', 'FontSize', 25);
plot(m,f(m));
plot(m,apxValue(v,m));
legend('wartosc dokladna','wartosc funkcji aproksymacyjnej')
hold off
f = @(x) sin(x)./(cos(x)+2);
v = approximation(f, n);
fm = f(m);
am = apxValue(v,m);
em = fm-am;
T = table(m,fm,am,em);
T.Properties.VariableNames = {'x', 'f', 'a', 'blad'};
disp(f);
disp(T);
subplot(2,3,2)
hold on
grid on
xlabel('\itx', 'FontSize', 20);
ylabel('\itf(x)', 'FontSize', 20);
title('\rm\itf\rm(x) = \itsin\rm(x)/(\itcos\rm(x)+2)', 'FontSize', 25);
plot(m,f(m));
plot(m,apxValue(v,m));
legend('wartosc dokladna','wartosc funkcji aproksymacyjnej')
hold off
f = @(x) exp(sin(x));
v = approximation(f, n);
fm = f(m);
am = apxValue(v,m);
em = fm-am;
T = table(m,fm,am,em);
T.Properties.VariableNames = {'x', 'f', 'a', 'blad'};
disp(f);
disp(T);
subplot(2,3,3)
hold on
grid on
xlabel('\itx', 'FontSize', 20);
ylabel('\itf(x)', 'FontSize', 20);
title('\rm\itf\rm(x) = e\it^s^i^n\rm^(^x^)', 'FontSize', 25);
plot(m,f(m));
plot(m,apxValue(v,m));
legend('wartosc dokladna','wartosc funkcji aproksymacyjnej')
hold off
f = @(x) exp(sin(x)).^cos(x);
v = approximation(f, n);
fm = f(m);
am = apxValue(v,m);
em = fm-am;
T = table(m,fm,am,em);
T.Properties.VariableNames = {'x', 'f', 'a', 'blad'};
disp(f);
disp(T);
subplot(2,3,4)
hold on
grid on
xlabel('\itx', 'FontSize', 20);
ylabel('\itf(x)', 'FontSize', 20);
title('\rm\itf\rm(x) = e\it^s^i^n\rm^(^x^)^\^\it^c^o^s\rm^(^x^)', 'FontSize', 25);
plot(m,f(m));
plot(m,apxValue(v,m));
legend('wartosc dokladna','wartosc funkcji aproksymacyjnej')
hold off
f = @(x) round(sin(x));
tic;
v = approximation(f, n);
fm = f(m);
am = apxValue(v,m);
toc;
em = fm-am;
T = table(m,fm,am,em);
T.Properties.VariableNames = {'x', 'f', 'a', 'blad'};
disp(f);
disp(T);
subplot(2,3,5)
hold on
grid on
xlabel('\itx', 'FontSize', 20);
ylabel('\itf(x)', 'FontSize', 20);
title('\rm\itf\rm(x) = round(\itsin\rm(x))', 'FontSize', 25);
plot(m,f(m));
plot(m,apxValue(v,m));
legend('wartosc dokladna','wartosc funkcji aproksymacyjnej')
hold off

