function price=Black_Scholes_call_price(s,tau,K,r,sigma);
%************************************************
% I modified your class code to a call price using put-call parity.
%************************************************
d1=(log(s/K)+(r+0.5*sigma^2)*tau)/(sigma*sqrt(tau));
d2=d1-sigma*sqrt(tau);
put_price=-s*0.5*(1+erf(-d1/sqrt(2)))+K*exp(-r*tau)*0.5*(1+erf(-d2/sqrt(2)));
price = s - K*exp(-tau*r)+put_price;