function [mean_price,std_price]=MC_european_call(S0,T,K,r,sigma,N_MC,Nt);
%**************************************************************************
% I modified your class code for barrier option to a european call option
%**************************************************************************
sample_payoff=zeros(1,N_MC);
logS=zeros(1,Nt);
dt=T/Nt;
%**************************************************************************
sigma_sqrt_dt=sqrt(dt)*sigma;
drift=(r-sigma^2/2)*(1:Nt)*dt;
%**************************************************************************
for i=1:N_MC %start Monte-Carlo simulations
    logS=drift+sigma_sqrt_dt*cumsum(randn(1,Nt)); %simulate trajectory of log(S_t/S_0)
        sample_payoff(i)=max(S0*exp(logS(end))-K,0);
end;
sample_payoff=sample_payoff*exp(-r*T);
%**************************************************************************
mean_price=mean(sample_payoff);
std_price=std(sample_payoff)/sqrt(N_MC);


