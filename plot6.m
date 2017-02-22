x = [0 : 0.01: 5];
y = exp(-x).* sin(2*x + 3);
plot(x, y), axis([0 20 -1 1])