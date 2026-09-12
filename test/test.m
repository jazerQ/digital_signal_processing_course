b = rand([1, 1e4]);
n = randn(size(b));


s = b + n;
plot(s)

c = randn([1e4, 1e4]);

c_f = fft2(c);

imagesc(abs(c_f))
figure
surf(angle(c_f))