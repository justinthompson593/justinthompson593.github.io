function [ Y ] = continuousFactorial( X )

% Y = Gamma(X+1) = X! 
%              (for X = a + i*b with a > 0) 

Y = integral(@(t) t.^(X).*exp(-t),0,Inf);

end

