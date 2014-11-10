function [ OUT ] = continuousFactorial( IN )

% OUT = Gamma(IN+1) = (IN)! 
%     (for input = IN = a + i*b with a > 0) 

OUT = integral(@(t) t.^(IN).*exp(-t),0,Inf);

end

