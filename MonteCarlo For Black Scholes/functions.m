%%
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
%%
function price=Black_Scholes_call_price(s,tau,K,r,sigma);
%************************************************
% I modified your class code to a call price using put-call parity.
%************************************************
d1=(log(s/K)+(r+0.5*sigma^2)*tau)/(sigma*sqrt(tau));
d2=d1-sigma*sqrt(tau);
put_price=-s*0.5*(1+erf(-d1/sqrt(2)))+K*exp(-r*tau)*0.5*(1+erf(-d2/sqrt(2)));
price = s - K*exp(-tau*r)+put_price;
