function f = approxP(t, r, k, theta, sigma, N_time, N_space)
i = floor(r*N_space);
j = floor(t*(N_time/10));
A = solveCIR(10, k, theta, sigma, N_time, N_space);
f = A(i, j);
end