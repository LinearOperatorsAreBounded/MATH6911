function [EY] = EY_exact(S0,K,T,r,sigma,N)
A = (r - sigma^2/2)*(T/2); B = sqrt(((2*N+1)/(6*(N+1))))*sigma*sqrt(T);

EY = exp(-r*T)*(S0*exp(A+((B^2)/2))*normcdf((1/B)*(log((S0/K))+A)+B)-...
    K*normcdf((1/B)*(log(S0/K)+A)));
end