U1 = 8; U2 = -3; U3 = 4; U4 = 0; T1 = 3/1000; T2 = 8/1000; Fd = 5000;
T = 1/Fd;

t1 = 0:T:T1;
t2 = T1:T:T2;
t = [t1 t2];

a1 = (U2-U1)/T1; b1 = U1; a2 = (U4-U3)/(T2-T1); b2 = U3 + 2.4; 

u1 = a1*t1 + b1; u2 = a2*t2 + b2;
x = [u1 u2];
plot(t, x);
stem(t, x);
grid on;

N = length(t);
k = (0:N-1).';
w = -pi:0.01:pi;

NM = (k * w)*(-1j);

eshka = exp(NM);

X = x * eshka;
f = Fd*w/(2*pi);

figure;
grid on;
subplot(2, 1, 1);
plot(f, abs(X));
subplot(2, 1, 2);
plot(f, angle(X));