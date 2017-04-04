function [mean_price,std_price]=MC_asian_call_GA(S0,K,T,r,sigma,N_MC,Nt,N)
%**************************************************************************
% I modified your class code for barrier option to a european call option
%**************************************************************************
sample_payoff=zeros(1,N_MC);
dt=T/(Nt);
%**************************************************************************
sigma_sqrt_dt=sqrt(dt)*sigma;
drift=(r-sigma^2/2)*(1:Nt)*dt;
%**************************************************************************
parfor i=1:N_MC %start Monte-Carlo simulations 
    logS=drift+sigma_sqrt_dt*cumsum(randn(1,Nt)); %simulate trajectory of log(S_t/S_0)
    G =log(S0*exp(logS((1))));    
        for j = 1:N
                G = G + log(S0*exp(logS((j*(Nt/N)))));
        end  
        G = exp((1/(N+1))*G);
        sample_payoff(i)=max(G-K,0);
end;
sample_payoff=sample_payoff*exp(-r*T);
%**************************************************************************
mean_price=mean(sample_payoff);
std_price=std(sample_payoff)/sqrt(N_MC);