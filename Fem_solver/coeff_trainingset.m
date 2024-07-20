addpath DataGeneration\
clc, clear, close all
x_min = 0;
x_max = 1;
y_min = 0;
y_max = 1;
f0 = @(x,y) 0.*x.*y + 1;
f1 = @(x,y) sin(x).*sin(y)+1;
f2 = @(x,y) x+y;
f3 = @(x,y) x.*y;
f4 = @(x,y) exp(x+y);
f={f0,f1,f2,f3,f4};
nRef = [2, 2, 3, 3, 3];
[Q_matrix] = generate_q(f, nRef, x_min, x_max, y_min, y_max, 'coefficient.txt');


