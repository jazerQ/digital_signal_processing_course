clear;
close all;

U1 = 9;
U2 = -3;
U3 = -8;
U4 = 5;
T1 = 3e-3;
T2 = 6e-3;
Fd = 5e3;

T = 1/Fd;

t_frag1 = 0:T:T1;

t_frag2 = T1:T:T2;

a1 = (U2 - U1)/T1;
b1 = U1;
x_frag1 = a1*t_frag1 + b1;
a2 = (U4 - U3)/(T2 - T1);
b2 = U3;
x_frag2 = a2*(t_frag2 - T1) + b2;

x_frag1(end) = (U2 + U3)/2;

t_frag2(1) = [];
x_frag2(1) = [];

t = [t_frag1, t_frag2];
x = [x_frag1, x_frag2];

N = length(x);
k = 0:N-1;

figure;

subplot(2,1,1);
plot(k, x, 'b-o');
grid on;
xlabel('Номер отсчета, k');
ylabel('x(k), В');
title('Дискретный сигнал (функция plot)');

subplot(2,1,2);
stem(k, x, 'filled');
grid on;
xlabel('Номер отсчета, k');
ylabel('x(k), В');
title('Дискретный сигнал (функция stem)');

M = 800;%число точек по частоте
w = linspace(-pi, pi, M); %нормированная частота,рад/отсчет

kk = (0:N-1).';
E = exp(-1j * kk * w);
X = x * E;
f = w * Fd / (2*pi);

figure('Name', 'Спектр дискретного сигнала');

subplot(2,1,1);
plot(f, abs(X));
grid on;
xlabel('f, Гц');
ylabel('|X(f)|, В');
title('Амплитудный спектр дискретного сигнала');

subplot(2,1,2);
plot(f, angle(X));
grid on;
xlabel('f, Гц');
ylabel('arg X(f), рад');
title('Фазовый спектр дискретного сигнала');

Tr = T/10;
t_rec = (t(1) - 5*T) : Tr : (t(end) + 5*T);
s_rec = zeros(size(t_rec));

for m = 1:N
    y = (t_rec - t(m)) / T;
    term = sin(pi*y) ./ (pi*y);
    term(y == 0) = 1;
    s_rec = s_rec + x(m) * term;
end

figure;
plot(t_rec, s_rec, 'b-', 'LineWidth', 1.2);
hold on;
stem(t, x, 'r', 'filled');
hold off;
grid on;
xlabel('t, с');
ylabel('s(t), В');
title('Восстановленный аналоговый сигнал и исходные отсчеты');
legend('Восстановленный сигнал s(t)', 'Отсчеты x(k)', 'Location', 'best');