clear;
f1=6;
dx =1/f1;
t2=7;
t1=2;
t = t1:dx:t2;
v = zeros(1,42);
v(1:12)=8;
v(12:42)=1.8*(t-2)-4;

plot(v);
