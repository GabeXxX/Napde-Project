function [uh_sorted] = row_wise_sort(uh,femregion)
% takes uh and the associated femregion and sorts them row_wise
uh_sorted = zeros(size(uh));
nRef = log2(sqrt(femregion.ndof) - 1);
Lx = femregion.domain(1,2) - femregion.domain(1,1);
Ly = femregion.domain(2,2) - femregion.domain(2,1);
for ii = 1:length(uh)
    x = femregion.coord(ii, 1);
    y = femregion.coord(ii, 2);
    k = (y/Ly * 2^nRef) * (2^nRef + 1) + (x/Lx * 2^nRef + 1);
    uh_sorted(k) = uh(ii);
end

