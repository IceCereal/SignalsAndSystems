clear
t1 = linspace(-1,5,2000);
x1 =@(t)(1.*(t>0 & t<1) + 2.*(t>1 & t<2) + (1.*(t>2 & t<3)));
x2 =@(t)((t).*(t>0 & t<1)+(1.*(t>1 & t<2))+((3-t).*(t>2 & t<3)));
x3 = @(t)(x1(t)+x2(t)); % addition of signals
x4 = @(t)(x1(t).*x2(t)); % multiplication of signals
subplot(2,2,1);
plot(t1,x1(t1));
subplot(2,2,2);
plot(t1,x2(t1));
subplot(2,2,3);
plot(t1,x3(t1));
subplot(2,2,4);
plot(t1,x4(t1));