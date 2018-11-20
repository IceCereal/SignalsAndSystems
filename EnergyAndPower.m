%%
clc
x1 = @(t)(10 * sin(10 * pi * t)); % function 1

energy = integral( @(t)x1(t).^2, -pi, pi);

%print(energy)
