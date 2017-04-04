%% the actual approximation of any input via rounding to nearest node
function f = approxP(t, r, k, theta, sigma, N_time, N_space)
i = floor(r*N_space);
j = floor(t*(N_time/10));
A = solveCIR(10, k, theta, sigma, N_time, N_space);
f = A(i, j);
end

%% the implementation of the scheme
function f = solveCIR(T, k, theta, sigma, N_time, N_space)
%time steps
delta_r = 1/N_space;
delta_t = T/N_time;
P = zeros(N_space+1, N_time+1);

%initial conditions
for i = 0:N_space
    P(i+1, 1) = 100;
end
%boundary conditions
for j = 0:N_time
    P(1, j+1) = 100;
end
for j = 0:N_time
    P(N_space+1, j+1) = 100*exp(-j*delta_t);
end
%iterate in time
 
for j = 1:N_time
     for i = 2:N_space
         P(i,j+1) = (((delta_t*k*(theta-i*delta_r))/(2*delta_r))+ ((delta_t*0.5*i*delta_r*(sigma^2))/(delta_r)^2))*P(i+1, j) ...
         +(((delta_t*0.5*i*delta_r*(sigma^2))/(delta_r)^2) - ((delta_t*k*(theta-i*delta_r))/(2*delta_r)))*P(i-1,j) ...
         +(1-2*((delta_t*0.5*i*delta_r*(sigma^2))/(delta_r)^2) - delta_t*i*delta_r)*P(i,j);
     end
end
f= P;
end
