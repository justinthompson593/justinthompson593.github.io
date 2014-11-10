function out  = f( z )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FUNCTION:    f(z)
%
%      INPUT:     z    a real or complex scalar value with
%                      real part larger than -1
%
%     OUTPUT:    out   Gamma(x+1)
%
%DESCRIPTION:
%
% Given a scalar, z, f(z) returns the value 
% of the Gamma function evaluated at z+1. 
%
% The Gamma function is the continuous 
% extension of the factorial function to real
% (and complex) numbers. For any positive
% integer, n, we have
%
%     Gamma(n - 1) = n! 
%
% You can think of Gamma as the function
% which "fills in" all the points between 
% the integers. For instance, we know that
%
%     3! = 3 * 2 * 1
% and
%
%     4! = 4 * 3 * 2 * 1
%
% But how do we get a (3.5)!, or a (pi)! ?
% It turns out that if z is one of those 
% "missing points" between the integers, 
% we can compute
%
%     Gamma(z) = (z-1)!
%
% But I don't want that. I want a new 
% function f(z) which gives me
%
%         f(z) =  z!
%
% So I want f(z) = z! = Gamma(z+1). 
% Looking up the formula for the Gamma 
% function on wikipedia, I find that
%
%Gamma(z) = integral(@(t) t.^(z-1).*exp(-t),0,Inf)
%
% Then I want
%
% output = integral(@(t) t.^(z).*exp(-t),0,Inf) = Gamma(x+1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

out = integral(@(t) t.^(z).*exp(-t),0,Inf);

end

