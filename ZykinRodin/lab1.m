clear;
%переменные
U1=4;
U2=4;
U3=8;
U4=0;
T1=6;
T2=10;
Fd=3;
T=1/Fd;
%отрезок1
t1=0:T:T1;
a1=(U2-U1)/T1;
b1=U1;
u1=a1*t1+b1;
%отрезок2
t2=(T1+T):T:T2;
a2=(U3-U2)/(T2-T1);
b2=U3-a2*T1;
u2=a2*t2+b2;
%полный сигнал
t=0:T:T2;
x=[u1,u2];
N=length(x);
%график
figure;
hold on; grid on;
plot(t,x,'b-');
stem(t,x,'filled');
xlabel('t, мс'); ylabel('U, B');
title('ƒискретный сигнал x(k) = s(kT)');

k=(0:N-1).';%вектор столбец номеров отсчетов
W=pi/500;%шаг по норм частоте
w=-pi:W:pi;%вектор норм частот
kw=k*w;%матрица произведений
E=exp(-1i*kw);%комплексные экспоненты
Sp=x*E;%спектр
f=Fd*w/(2*pi);%переход к линейной частоте

figure;
subplot(2,1,1);
plot(f,abs(Sp));
xlabel('f, к√ц');ylabel('|X(f)|');
title('јмплитудный спектр дискретного сигнала'); grid on;

subplot(2,1,2);
plot(f,abs(Sp));
xlaqbel('f, к√ц');ylabel('argX(f),рад');
title('‘азовый спектр дискретного сигнала'); grid on;
td=(-5*T):(T/10):(T2+5*T);
Sr=zeros(1,length(td));
for i=1:N
    Sr=Sr+x(i)*sinc((td-(i-1)*T)/T);
end

figure;
hold on;grid on;
plot(td,Sr,'r-','LineWidth',1.2);
stem(t,x,'filled');
xlabel('t,мс'); ylabel('U, B');
title('»сходный и восстановленный сигналы');
legend('восстановленный сигнал s(t)','отсчеты x(k)');