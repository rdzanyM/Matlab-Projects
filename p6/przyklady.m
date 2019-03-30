b = 4;
f = @(x,y,z) 3*y + 4*z;
g = @(x,y,z) -4*y + 3*z;
[x1,y1,z1] = rk4( f, g, 0, 1, 0, b, 6 );
[x2,y2,z2] = rk4( f, g, 0, 1, 0, b, 20 );
[x3,y3,z3] = rk4( f, g, 0, 1, 0, b);
[x4,y4,z4] = rk4( f, g, 0, 1, 0, b, 1e4);
z = @(x) cos(4*x).*exp(3*x);
y = @(x) sin(4*x).*exp(3*x);

figure
subplot(2,2,1)
hold on;
grid on;
fplot(y, [0,b], 'b');
fplot(z, [0,b], 'r');
plot(x1,y1, 'b:.', 'MarkerSize', 10);
plot(x1,z1, 'r:.', 'MarkerSize', 10);
legend('dokladna wartosc \ity(x)', 'dokladna wartosc \itz(x)', 'wyznaczona wartosc \ity(x)', 'wyznaczona wartosc \itz(x)', 'Location', 'NorthWest')
xlabel('x');
title('6 punktow');

subplot(2,2,3)
hold on;
grid on;
plot(x1,abs(y1 - y(x1)), 'b--.', 'MarkerSize', 10);
plot(x1,abs(z1 - z(x1)), 'r--.', 'MarkerSize', 10);
legend('blad \ity(x)', 'blad \itz(x)', 'Location', 'NorthWest')
xlabel('x');

subplot(2,2,2)
hold on;
grid on;
fplot(y, [0,b], 'b');
fplot(z, [0,b], 'r');
plot(x2,y2, 'b:.', 'MarkerSize', 10);
plot(x2,z2, 'r:.', 'MarkerSize', 10);
legend('dokladna wartosc \ity(x)', 'dokladna wartosc \itz(x)', 'wyznaczona wartosc \ity(x)', 'wyznaczona wartosc \itz(x)', 'Location', 'NorthWest')
xlabel('x');
title('20 punktow');

subplot(2,2,4)
hold on;
grid on;
plot(x2,abs(y2 - y(x2)), 'b--.', 'MarkerSize', 10);
plot(x2,abs(z2 - z(x2)), 'r--.', 'MarkerSize', 10);
legend('blad \ity(x)', 'blad \itz(x)', 'Location', 'NorthWest')
xlabel('x');

figure
subplot(2,2,1)
hold on;
grid on;
fplot(y, [0,b], 'b');
fplot(z, [0,b], 'r');
plot(x3,y3, 'b:.', 'MarkerSize', 10);
plot(x3,z3, 'r:.', 'MarkerSize', 10);
legend('dokladna wartosc \ity(x)', 'dokladna wartosc \itz(x)', 'wyznaczona wartosc \ity(x)', 'wyznaczona wartosc \itz(x)', 'Location', 'NorthWest')
xlabel('x');
title('100 punktow');

subplot(2,2,3)
hold on;
grid on;
plot(x3,abs(y3 - y(x3)), 'b--.', 'MarkerSize', 10);
plot(x3,abs(z3 - z(x3)), 'r--.', 'MarkerSize', 10);
legend('blad \ity(x)', 'blad \itz(x)', 'Location', 'NorthWest')
xlabel('x');

subplot(2,2,2)
hold on;
grid on;
fplot(y, [0,b], 'b');
fplot(z, [0,b], 'r');
plot(x4,y4, 'b:');
plot(x4,z4, 'r:');
legend('dokladna wartosc \ity(x)', 'dokladna wartosc \itz(x)', 'wyznaczona wartosc \ity(x)', 'wyznaczona wartosc \itz(x)', 'Location', 'NorthWest')
xlabel('x');
title('10^4 punktow');

subplot(2,2,4)
hold on;
grid on;
plot(x4,abs(y4 - y(x4)), 'b');
plot(x4,abs(z4 - z(x4)), 'r');
legend('blad \ity(x)', 'blad \itz(x)', 'Location', 'NorthWest')
xlabel('x');




b = 5;
f = @(x,y,z) -1./x.^2;
g = @(x,y,z) y;
[x1,y1,z1] = rk4( f, g, 1, 1, 1, b, 6 );
[x2,y2,z2] = rk4( f, g, 1, 1, 1, b, 20 );
[x3,y3,z3] = rk4( f, g, 1, 1, 1, b);
[x4,y4,z4] = rk4( f, g, 1, 1, 1, b, 1e4);
z = @(x) log(x) + 1;
y = @(x) 1./x;

figure
subplot(2,2,1)
hold on;
grid on;
fplot(y, [1,b], 'b');
fplot(z, [1,b], 'r');
plot(x1,y1, 'b:.', 'MarkerSize', 10);
plot(x1,z1, 'r:.', 'MarkerSize', 10);
legend('dokladna wartosc \ity(x)', 'dokladna wartosc \itz(x)', 'wyznaczona wartosc \ity(x)', 'wyznaczona wartosc \itz(x)', 'Location', 'NorthWest')
xlabel('x');
title('6 punktow');

subplot(2,2,3)
hold on;
grid on;
plot(x1,abs(y1 - y(x1)), 'b--.', 'MarkerSize', 10);
plot(x1,abs(z1 - z(x1)), 'r--.', 'MarkerSize', 10);
legend('blad \ity(x)', 'blad \itz(x)', 'Location', 'NorthWest')
xlabel('x');

subplot(2,2,2)
hold on;
grid on;
fplot(y, [1,b], 'b');
fplot(z, [1,b], 'r');
plot(x2,y2, 'b:.', 'MarkerSize', 10);
plot(x2,z2, 'r:.', 'MarkerSize', 10);
legend('dokladna wartosc \ity(x)', 'dokladna wartosc \itz(x)', 'wyznaczona wartosc \ity(x)', 'wyznaczona wartosc \itz(x)', 'Location', 'NorthWest')
xlabel('x');
title('20 punktow');

subplot(2,2,4)
hold on;
grid on;
plot(x2,abs(y2 - y(x2)), 'b--.', 'MarkerSize', 10);
plot(x2,abs(z2 - z(x2)), 'r--.', 'MarkerSize', 10);
legend('blad \ity(x)', 'blad \itz(x)', 'Location', 'NorthWest')
xlabel('x');

figure
subplot(2,2,1)
hold on;
grid on;
fplot(y, [1,b], 'b');
fplot(z, [1,b], 'r');
plot(x3,y3, 'b:.', 'MarkerSize', 10);
plot(x3,z3, 'r:.', 'MarkerSize', 10);
legend('dokladna wartosc \ity(x)', 'dokladna wartosc \itz(x)', 'wyznaczona wartosc \ity(x)', 'wyznaczona wartosc \itz(x)', 'Location', 'NorthWest')
xlabel('x');
title('100 punktow');

subplot(2,2,3)
hold on;
grid on;
plot(x3,abs(y3 - y(x3)), 'b--.', 'MarkerSize', 10);
plot(x3,abs(z3 - z(x3)), 'r--.', 'MarkerSize', 10);
legend('blad \ity(x)', 'blad \itz(x)', 'Location', 'NorthWest')
xlabel('x');

subplot(2,2,2)
hold on;
grid on;
fplot(y, [1,b], 'b');
fplot(z, [1,b], 'r');
plot(x4,y4, 'b:');
plot(x4,z4, 'r:');
legend('dokladna wartosc \ity(x)', 'dokladna wartosc \itz(x)', 'wyznaczona wartosc \ity(x)', 'wyznaczona wartosc \itz(x)', 'Location', 'NorthWest')
xlabel('x');
title('10^4 punktow');

subplot(2,2,4)
hold on;
grid on;
plot(x4,abs(y4 - y(x4)), 'b');
plot(x4,abs(z4 - z(x4)), 'r');
legend('blad \ity(x)', 'blad \itz(x)', 'Location', 'NorthWest')
xlabel('x');

