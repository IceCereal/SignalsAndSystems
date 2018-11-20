clc
x =@(t)((1-abs(t)/0.5).*(t>=-0.5 & t<=0.5)+0.*(t<=-0.5 & t>=0.5));
C = zeros(1,50);
f = zeros(1,50);
phase = zeros(1,50);
Cn = @(n)(integral(@(t)(x(t).*exp(-1j*n*t)),0,2*pi));
z = Cn(0);
for count = 1:50
    C(count) = abs(Cn(count));
    phase(count) = angle(Cn(count));
    f(count) = count;
    z =@(t)(z(t) + (Cn(count).*exp(1j*1*count*t)));
end
subplot(3,1,1);
stem(f,C);
title('Magnitude spectrum');
subplot(3,1,2);
stem(f,phase);
title('Phase spectrum');