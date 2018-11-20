x = [-1, 3, 2, 1];
Y = zeros(1, 4);

for k = 1:4
    for n = 1:4
        Y = Y + [x(n) * exp((-j * 2 * pi * (k-1) * (n-1))/4)];
    end
    
    x(k) = Y(n)
end

disp(x)