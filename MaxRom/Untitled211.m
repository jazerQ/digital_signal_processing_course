U1 = 8; U2 = 8; U3 = -6; U4 = 0; T1 = 6/1000; T2 = 9/1000; Fd = 3000;
Td = 1/Fd; 
t1 = 0:Td:T1;
t2 = T1:Td:T2;
t = [t1, t2];
u1 = 0 * t1 + U2;
a2 = (U4 - U3)/(T2 - T1); b2 = -18;
u2 = a2 * t2 + b2;
U = [u1, u2];
%plot(t, U);

stem(t, U);

N = length(t);
k = (0:N-1).';
w = (-pi:0.01:pi);

z = k * w;
z = z * -1j;

Z = exp(z);

ZX = U * Z;

f = Fd * w / 2 * pi; 
figure; 
subplot(2, 1, 1);
plot(f, abs(ZX));
subplot(2, 1, 2);
plot(f, angle(ZX));

t3 = 0:Td/10:T1;
t4 = T1:Td/10:15/1000;
tt = [t3, t4];






