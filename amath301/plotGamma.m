clear all;close all;clc

% Plotting f(x) = Gamma(x+1)

x = 0:0.01:2;

%%%%%% evaluateF(f,x) %%%%%%
y = zeros(size(x));

for i = 1:size(y,2)
    
    y(i) = f(x(i));
    
end
%%%%%% evaluateF(f,x) %%%%%%

plot(x,y)
