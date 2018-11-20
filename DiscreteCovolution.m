n = -10:50;
x1 = (1).*(n>=0).*n + (0).*(n<0).*n;
x2 = (1).*(n>=0).*exp(3*n) + (0).*(n<0).*exp(3*n);
X = x1;
Y = x2;
z = zeros(1,length(X)+length(Y)-1);
X = [X,zeros(1,length(Y)-1)];
Y = [Y,zeros(1,length(X)-1)];
z(1) = X(1)*Y(1);
for i = 2:(length(x1)+length(x2)-1)
    for j = 1:i
        z(i) = z(i) + X(j)*Y(i+1-j);
    end
end
subplot(3,1,1)
stem(x1)
subplot(3,1,2)
stem(x2)
subplot(3,1,3)
stem(z)
title('Convolution of discrete signals')