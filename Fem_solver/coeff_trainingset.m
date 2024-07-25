addpath DataGeneration\
clc, clear, close all
x_min = 0;
x_max = 1;
y_min = 0;
y_max = 1;
f0 = @(x,y) 0.*x.*y + 1;
f1 = @(x,y) sin(x).*sin(y)+1;
f2 = @(x,y) x+y+0.1;
f3 = @(x,y) x.*y+0.1;
f4 = @(x,y) exp(x+y);
%f={f0,f1,f2,f3,f4};
f={f4};
nPoints = [5];  %these are the number of suddivision of each edge, number of points will be (2^n + 1) ^2
[Q_matrix] = generate_q(f, nPoints, x_min, x_max, y_min, y_max, 'convergence_test_coefficient.txt');


