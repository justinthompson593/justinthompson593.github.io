clear all;close all;clc

% The Logistic Map
%    x_{k+1} = r * x_n * (1 - x_n)     for 0 <= x_i <= 1

x0 = 1/2;       %initial condition

logMap = @(x,r) r*x*(1-x)