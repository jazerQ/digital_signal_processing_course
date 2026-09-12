U1 = 6;
U2 = 6;
U3 = 9;
U4 = -5;
T1 = 3;
T2 = 9;
Fd = 5;
Td = 1/Fd;
T = 0:1/Fd:T2;
Ut1 = 0 * T(1:15) + 6;
Ut2 = -7/3 * T(16:46) + 16;
Ut = [Ut1 Ut2];
plot(T,Ut);
grid on;
K = (0:45).';
w = (-pi:pi/250:pi);
et = exp((K * w) * 1i);
Uw = Ut * et;
plot(w,abs(Uw));
plot(w,angle(Uw));
T3 = -0.1:1/(10*Fd):9.1;
St = T3 * 0;
for k = 1:46
    St = St + Ut(k)*sin((pi*T3 - k * Td)/Td)/((pi*T3 - k * Td)/Td);
end
plot(T3,St)