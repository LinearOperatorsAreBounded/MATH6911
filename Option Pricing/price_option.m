%%
function [h s p] = price_option(u, d, r , S0, K, N)
%matrices for the outputs
Stock_Price_Evolution = zeros(N+1);
Option_Prices = zeros(N+1);
Hedge_Ratio = zeros(N+1);
%get all the stock prices 
for i = 1:N+1 
    for j = 1:i
        Stock_Price_Evolution(j,i) = S0*u^((i-1)-(j-1))*d^((j-1));
    end
end
%base case for call prices
for j = 1:N+1
    Option_Prices(j, N+1) = max(Stock_Price_Evolution(j,N+1)-K, 0);
end
%fill in rest of the matrices
for i = N:-1:1
    for j = 1:i
        
        Hedge_Ratio(j,i) = (Option_Prices(j, i+1)- Option_Prices(j+1, i+1))/((Stock_Price_Evolution(j,i+1))-(Stock_Price_Evolution(j+1,i+1)));
        Option_Prices(j,i) = Hedge_Ratio(j,i)*(Stock_Price_Evolution(j,i)) + (1/(1+r))*((u*Option_Prices(j+1, i+1)-d*Option_Prices(j, i+1))/(u-d));
    end
end
h = Hedge_Ratio;
s = Stock_Price_Evolution;
p = Option_Prices;
end