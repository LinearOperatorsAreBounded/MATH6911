function [mean_price,std_price, c] = MC_asian_call_control_variate(S0,K,T,r,sigma,N_MC,Nt,N)
%estimating c*
sample_payoff1=zeros(1,N_MC);
sample_payoff2=zeros(1,N_MC);
dt=T/(Nt);
%**************************************************************************
sigma_sqrt_dt=sqrt(dt)*sigma;
drift=(r-sigma^2/2)*(1:(Nt))*dt;
parfor i=1:(N_MC/10) %start Monte-Carlo simulations 
    logS=drift+sigma_sqrt_dt*cumsum(randn(1,Nt)); %simulate trajectory of log(S_t/S_0)
    G =log(S0*exp(logS((1))));    
        for j = 1:N
        G = G + log(S0*exp(logS((j*(Nt/N)))));
        end  
        G = exp((1/(N+1))*G);
        sample_payoff1(i)=max(G-K,0);
        
    G = (S0*exp(logS(1)));    
        for j = 1:N
        G = G + (S0*exp(logS(j*(Nt/N))));
        end  
        G = (1/(N+1))*G;
        sample_payoff2(i)=max(G-K,0);
end;
sample_payoff1=sample_payoff1*exp(-r*T);
sample_payoff2=sample_payoff2*exp(-r*T);
mat_cov = cov(sample_payoff1, sample_payoff2);
c = -mat_cov(2,1)/mat_cov(2,2);
%**************************************************************************
%getting price 
EY = EY_exact(S0,K,T,r,sigma,N);
parfor i=1:N_MC %start Monte-Carlo simulations 
    logS=drift+sigma_sqrt_dt*cumsum(randn(1,Nt)); %simulate trajectory of log(S_t/S_0)
    GX = (S0*exp(logS(1)));    
    GY = log(S0*exp(logS((1))));    
    for j = 1:N
        GX = GX + (S0*exp(logS(j*(Nt/N))));
        GY = GY + log(S0*exp(logS((j*(Nt/N)))));    
        end  
        GX = (1/(N+1))*GX;
        GY = exp((1/(N+1))*GY);
        sample_payoff(i)=max(GX-K,0) + c*(max(GY-K,0)- EY);
end;
mean_price=mean(sample_payoff);
std_price=std(sample_payoff)/sqrt(N_MC);