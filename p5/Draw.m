%rysuje wykresy powownania czasu uzywajac funkcji tworzonych przez
%CompareTime
figure
hold on
plot(2:160, sp(1:159))
plot(2:160, nsp(1:159))
legend({'z uzyciem macierzy sparse', 'bez macierzy sparse'}, 'FontSize', 16)
legend('Location', 'northwest')
title('Porownanie czasu wykonania funkcji qrGivens', 'Fontsize', 16)
ylabel('sredni czas wykonania [s]', 'FontSize', 20)
xlabel('rozmiar macierzy', 'FontSize', 20)

figure
subplot(2,1,1)
hold on
plot(1:40, std(1:40))
plot(1:40, sft(1:40))
legend({'standard', 'shift'}, 'FontSize', 16)
legend('Location', 'northwest')
title('Porownanie czasu wykonania funkcji eigQRG z przesunieciem i bez', 'Fontsize', 16)
ylabel('sredni czas wykonania [s]', 'FontSize', 20)
xlabel('rozmiar macierzy', 'FontSize', 20)
subplot(2,1,2)
hold on
plot(1:200, clf(1:200))
plot(1:200, mat(1:200))
legend({'closedForm', 'eig'}, 'FontSize', 16)
legend('Location', 'northwest')
title("Porownanie czasu wykonania funkcji eigQRG(n,'closedForm') i matlabowej funkcji eig", 'Fontsize', 16)
ylabel('sredni czas wykonania [s]', 'FontSize', 20)
xlabel('rozmiar macierzy', 'FontSize', 20)

figure
subplot(2,1,1)
title('Porownanie czasu wykonania eigQRG z przesunieciem w zaleznosci od wzglednej odleglosci miedzy wartosciami wlasnymi', 'Fontsize', 20)
hold on
plot(1:10, sft(1:10))
plot(1:10, cls(1:10))
legend({'macierz z tematu', 'wartosci wlasne blizej siebie'}, 'FontSize', 16)
legend('Location', 'northwest')
ylabel('sredni czas wykonania [s]', 'FontSize', 20)
xlabel('rozmiar macierzy', 'FontSize', 20)
subplot(2,1,2)
hold on
plot(1:30, sft(1:30))
plot(1:30, far(1:30))
legend({'macierz z tematu', 'wartosci wlasne dalej od siebie'}, 'FontSize', 16)
legend('Location', 'northwest')
ylabel('sredni czas wykonania [s]', 'FontSize', 20)
xlabel('rozmiar macierzy', 'FontSize', 20)