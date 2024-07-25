clc, clear, close all
addpath ConvergenceTest\

TestName = 'ConvergenceTest';
load('convergence_test_coefficient.mat') %% see functions.m --> muA
Data = C_dati(TestName);

n_tests = length(Data.refinement_vector);

for i_test = 1:n_tests
    [~, femregion, errors, ~]= C_main2D(TestName, Data.refinement_vector(i_test), Q_matrix, true);
    err_L2(i_test) = errors.Error_L2;
    err_H1(i_test) = errors.Error_H1;
    h(i_test) = femregion.h;
end

%%
figure()
loglog(h, [err_L2;err_H1],'o-','linewidth',2)
hold on
loglog(h, 10*h, 'k-','linewidth',2)
loglog(h, 10*h.^2, 'k--','linewidth',2)
grid on
legend('L^2','H^1','h','h^2')
T=table(h', err_H1', err_L2', VariableNames={'h', 'L^2','H^1'})