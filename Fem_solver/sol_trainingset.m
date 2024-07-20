addpath DataGeneration\
clc, clear, close all
nRef_vector= 4*ones(100,1);
q_file = "C:\Users\rikyr\OneDrive\Desktop\NAPDE\Napde-VAE\data\q_file.txt";
uh_file = 'uh_file1.txt';
TestName = 'Test1';
[sol_Matrix] = generate_sol(TestName, q_file, uh_file, nRef_vector);






%Test per vedere se funziona
% uh=sol_Matrix(5,:);
% uh=reshape(uh, 9,9);
% 
% uex= @(x,y) x.*y.*(1-x).*(1-y);
% xx=linspace(0,1,9);
% yy=linspace(0,1,9);
% for ii=1:9
%     for jj=1:9
%         UEX(ii,jj)=uex(xx(ii),yy(jj));
%     end
% end