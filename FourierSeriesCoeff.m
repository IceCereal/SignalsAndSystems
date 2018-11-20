t=linspace(-5,5,101);
T=2;
%time period is 2 repeats after every 2sec
w0=(2*pi)/T;
u_t = @(t) (0*(t<0) + 1*(t>=0));
% defining the func.
x_t = @(t) (u_t(t+0.5) - u_t(t-0.5));
y_t = @(t) (x_t(t).*((t >= -0.5) & (t <= 0.5))) ;
a_o=(1/T)*integral(@(t)y_t(t),0,2*pi);
sum = zeros(1,101);
for n=1:200
    f=@(t) y_t(t).*cos(n*w0*t);
    a_n= (2/T).*integral(@(t)f(t),0,2*pi);
    %writing fourier
    %coefficients
    g=@(t) y_t(t).*sin(n*w0*t);
    b_n= (2/T).*integral(@(t)g(t),0,2*pi);
    sum = sum + a_n .*cos(n*w0*t)+ b_n .*sin(n*w0*t);
    a_n1=@(t) (2/T).*integral(@(t)f(t),0,2*pi);
    c_n(n) = abs(a_n);
    d_n(n) = abs(b_n);
    subplot(3,1,3)
    stem(c_n);
    title('an');
    subplot(3,1,2)
    stem(d_n);
    title('bn');
end
X = (a_o)+sum;
subplot(3,1,1)
plot(X);
title('reconstructed signal');