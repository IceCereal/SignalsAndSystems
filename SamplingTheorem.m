% y(t) = 1+4cos(2000*pi*t)+ sin(1000*pi*t) is given to you & sampling it
% using Nyquist criterion and reconstruct the original
clear;
t = linspace(-20, 20, 1000);
n = 1:1000;

x1 = @(t)ones(1, length(t));
x2 = @(t) 4 * cos(2000 * pi .* t);
x3 = @(t) sin(1000 * pi .* t);
y = @(t) x1(t) + x2(t) + x3(t);

hold on
subplot(5, 1, 1);
plot(t, y(t));
title("OG sample");
hold off

fm = 1000; %fmax

%case 1: fs = 2*fm [Nyquist]
fs_1 = 2 * fm;
sample_1 = @(n) y(n .* (1/fs_1));

hold on
subplot(5,1,2);
stem(n, sample_1(n));
title("Nyqusit Criterion");
hold off

%case 2: fs >= 2*fm
fs_2 = 6 * fm;
sample_2 = @(n) y(n .* (1/fs_2));

hold on
subplot(5,1,3);
stem(n, sample_2(n));
title("> NC");
hold off

%case 3: fs < 2*fm 
fs_3 = 0.1 * fm;
sample_3 = @(n) y(n .* (1/fs_3));

hold on
subplot(5,1,4);
stem(n, sample_3(n));
title("< NC");
hold off

