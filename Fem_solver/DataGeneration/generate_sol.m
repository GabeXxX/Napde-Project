function [sol_Matrix] = generate_sol(TestName, q_file, uh_file, nRef_vector)
%this function takes as input the file containing at each line one
%distribution of q, a vector of nRef, and the name of the test to get the data.
%It computes the solution for each q with the corrispondent nRef and
%returns a matrix where each row is a solution. It also writes a file .txt
%called uh_file

sol_Matrix=zeros(length(nRef_vector), (2^max(nRef_vector)+1)^2);

coeff_fileID = fopen(q_file, 'r');
sol_fileID = fopen(uh_file, 'w');

if coeff_fileID == -1
    error('Unable to read the file: %s', q_file);
end

if sol_fileID == -1
    error('Unable to write the file: %s', uh_file);
end

ii=1;
while ~feof(coeff_fileID)
    nRef = nRef_vector(ii);

    line = fgetl(coeff_fileID);
    diff_coeff = sscanf(line, '%f');
    diff_coeff = reshape(diff_coeff, sqrt(length(diff_coeff)), sqrt(length(diff_coeff)));

    [uh, femregion, ~, ~] = C_main2D(TestName, nRef, diff_coeff, false);
    uh = row_wise_sort(uh, femregion);
    uh = full(uh');
    sol_Matrix(ii, 1: (2^nRef+1)^2) = uh;

    fprintf(sol_fileID, '%f\t', uh);
    fprintf(sol_fileID, '\n');

    %uh = reshape(uh, 2^nRef +1, 2^nRef +1);
    disp(ii)
    ii = ii+1;
end

fclose(coeff_fileID);
fclose(sol_fileID);


end

