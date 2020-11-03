function Teoplitz_Matrix(a,b)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Author        : Yiwei Xue
% Date          : 1 November 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



coloum = [a, zeros(1,length(b)-1)];
row = [a(1), zeros(1,length(b)-1)];

toeplitz(coloum, row)

end