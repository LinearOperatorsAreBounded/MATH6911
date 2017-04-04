function z = P(t, r, k, theta, sigma)
gamma = sqrt(k^2+2*sigma^2);
z = 100*A(t, gamma, k, sigma, theta)*exp(-B(t, gamma, k)*r);
end
