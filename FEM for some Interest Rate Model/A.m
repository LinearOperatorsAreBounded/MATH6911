function f = A(t, gamma, k, sigma, theta)
f = ((2*gamma*exp(0.5*(k+gamma)*t))/((k+gamma)*(exp(gamma*t)-1)+2*gamma))^((2*k*theta)/sigma^(2));
end