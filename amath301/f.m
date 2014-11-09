function [ out ] = f( x )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FUNCTION:    f(x)
%
%      INPUT:     x    a real or complex
%                      scalar value with
%                      positive real part
%
%     OUTPUT:    out   Gamma(x)
%
%DESCRIPTION:
%
% Given a scalar, real-valued number x, f(x) 
% returns the value of the Gamma function 
% evaluated at x. 
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
% It turns out that if x is one of those 
% "missing points" between the integers, 
% we can compute
%
%     Gamma(x) = (x-1)!
%
% But I don't want that. I want a new 
% function f(x) which gives me
%
%         f(x) =  x!
%
% So I want f(x) = x! = Gamma(x+1). 
% Looking up the formula for the Gamma 
% function on wikipedia, I find that
%
%Gamma(x) = integral(@(t) t.^(x-1).*exp(-t),0,Inf)
%
% Then I want
%
% output = int( t.^(x).*exp(-t),0,Inf) = Gamma(x+1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

out = integral(@(t) t.^(x-1).*exp(-t),0,Inf);

end

