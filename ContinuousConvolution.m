t = linspace(-1,20,100);
x1 = @(t) 1.*exp(3.*t).*(t>=0);
subplot(2,2,1)
plot(x1(t))
title('x1(t)');
x2 = @(t) 1*t(t>=0);
subplot(2,2,2)
plot(x2(t));
title('x2(t)');
x3 = conv(x1(t),x2(t));
subplot(2,2,3)
plot(x3);
title('convolution using inbuilt function');
X = x1(t);
Y = x2(t);
z = zeros(1,length(X)+length(Y)-1);
X = [X,zeros(1,length(Y)-1)];
Y = [Y,zeros(1,length(X)-1)];
z(1) = X(1)*Y(1);
for i = 2:(length(x1(t))+length(x2(t))-1)
    for j = 1:i
        z(i) = z(i) + X(j)*Y(i+1-j);
    end
end
subplot(2,2,4)
plot(z)
title('convolution using definition')