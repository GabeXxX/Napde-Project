function [Q_matrix] = generate_q(f_vector, n_vector, x_min, x_max, y_min, y_max, coeff_file)

% This function takes a {} vector of N functions representing the distribution of q over the domain
% and a vector of N integers representing the number of points where we want
% to evalutate q (#points = (2^n +1)^2, because we divide each side in half n times)
%the domain is a rectangle specified by x_min, x_max, y_min, y_max
%the output is a matrix with N rows, each row represents the evaluation of the
%coefficient over the domain, stored in a row_wise order (i.e. if the matrix is 
%[1,2; 3,4] the row representing it will be [1,2,3,4])
%The function will also write a coeff_file.txt file containing the matrix

N = min(length(f_vector), length(n_vector));
if length(f_vector) ~= length(n_vector)
    warning("inputs have different sizes: only the first %d functions will be taken in account", N);
end
Q_matrix = zeros(N, (2^max(n_vector)+1)^2);

for ii = 1:N
    f = f_vector{ii};
    nRef = n_vector(ii);
    xx = linspace(x_min, x_max, 2^nRef+1);
    yy = linspace(y_min, y_max, 2^nRef+1);
    k=1;
    for x=xx
        for y=yy
            Q_matrix(ii, k) = f(x,y);
            k = k+1;
        end
    end
end

%writing the .txt file
nPoints = (2.^n_vector+1).^2;
fileID = fopen(coeff_file, 'w');

for ii = 1:N
    fprintf(fileID, '%f\t', Q_matrix(ii, 1:nPoints(ii)));
    fprintf(fileID, '\n');
end

fclose(fileID);
