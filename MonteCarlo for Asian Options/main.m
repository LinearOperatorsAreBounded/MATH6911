%% Assignment 4 
% Hao Ran Li 215125875
%% $S_{0} = 100, K = 100, \sigma = 0.3, r = 0.0.3, T = 1$
%For each of the Matrix printed below, Rows are number of Monte Carlo
%iterations, and Columns are number of points averaged
%% 2. Using geometric averaging and comparing it with the exact formula

N_MC = [1000 50000 500000]; N = [5 20 100];
MC_estimate_matrix = ones(3);
MC_std_matrix = ones(3);
exact_prices = [];
for i = 1:3
    for j = 1:3
        [a b] = MC_asian_call_GA(100,100,1,0.03,0.3,N_MC(i),10000,N(j));
        MC_estimate_matrix(i,j) = a;
        MC_std_matrix(i,j) = b;
    end
end

for i = 1:3
        exact_prices(i) = EY_exact(100,100,1,0.03,0.3,N(i));
end
MC_estimate_matrix 
MC_std_matrix
exact_prices
%% 3. Using arithmetic averaging 

MC_estimate_matrix = ones(3);
MC_std_matrix = ones(3);
for i = 1:3
    for j = 1:3
        [a b] = MC_asian_call(100,100,1,0.03,0.3,N_MC(i),10000,N(j));
        MC_estimate_matrix(i,j) = a;
        MC_std_matrix(i,j) = b;
    end
end
MC_estimate_matrix
MC_std_matrix

%% 4. Usining control variate for arithmetic averaging
c_matrix = ones(3);
MC_estimate_matrix = ones(3);
MC_std_matrix = ones(3);
for i = 1:3
    for j = 1:3
        [a b c] = MC_asian_call_control_variate(100,100,1,0.03,0.3,N_MC(i),10000,N(j));
        MC_estimate_matrix(i,j) = a;
        MC_std_matrix(i,j) = b;
        c_matrix(i,j) = c;
    end
end
MC_estimate_matrix
MC_std_matrix
c_matrix
