U_1 = 5;
U_2 = 10;
U_3 = 8;
U_4 = -7;
T_1 = 3 * 10^-3;
T_2 = 10^-2;

f_d = 4*10^3;

T = 1/f_d;

t1 = 0:T:T_1;
t2 = T_1:T:T_2;
b1 = U_1;
a1 = (U_2 - U_1) / T_1;

a2 = (U_4 - U_3) / (T_2 - T_1);
b2 = U_3 - a2 * T_1;

u1 = a1 * t1 + b1;

t_total = 0:T:T_2;
u_total = zeros(size(t_total));

for i = 1:length(t_total)
    if t_total(i) <= T_1
        u_total(i) = a1 * t_total(i) + b1;
    else
        u_total(i) = a2 * t_total(i) + b2;
    end
end

figure;
plot(t_total*1000, u_total, "b-o", "MarkerSize", 4);
grid on;
xlabel("Time, ms");
ylabel("U, V");
title("Кусочно линейный сигнал");
% ylim([0 11])

plot([0,T_1]*1000, [U_1, U_2, U_3], "r*", "MarkerSize", 10);
legend("Signal", "Ключевые точки");
% u = (1:1e4) *1e-4;
% u2 = (1:1e3) *1e-3;
% 
% b = zeros(size(u));
% c = ones(size(u));
% 
% b .* c

