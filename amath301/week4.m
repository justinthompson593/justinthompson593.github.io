clear all;close all;clc
 
%% Vandermonde Matrices

%Simple example

%Sample your data at times 1, 2, and 3
t = [1;2;3];        

%Let's make data that's actually a polynomial,
%so that we can easily check our work.
%
% data(t) = t^2 - 2*t + 1
%
% data = [1^2 - 2*1 + 1;...
%         2^2 - 2*2 + 1;...
%         3^2 - 2*3 + 1];    
data = [0;1;4]

%We want a polynomial 
%
%   P(t) = a2*t^2 + a1*t + a0
%
%which approximates our data. That is, we want 
%the coefficients, coeffs = [a2; a1; a0], so that
%
% a2*1^2 + a1*1 + a0 = 0 = data(1)
% a2*2^2 + a1*2 + a0 = 1 = data(2)
% a2*3^2 + a1*3 + a0 = 4 = data(3)
%
%Another way to write it:
%
% |1^2  1  1| |a2|      |0|
% |2^2  2  1| |a1|  =   |1|
% |3^2  3  1| |a0|      |4|
%
%Another way (as Matrices and vectors):
%
% VandermondeMatrix * coeffs = data
%
%Since we know when we sampled (our t vector), we 
%know what the Vandermonde matrix looks like
%
VDM = vander(t)
%
%That gives us a 3x3 matrix VDM such that
%
% VDM * coeffs = data
%
%So to get the coeffficients we want, we can do this
%
%      coeffs = VDM^(-1)*data
%
%or in Matlab

coeffs = VDM\data    %because we don't use "inverse"

%Compare against known coefficients (1,-2,1)
trueCoeffs = [1;-2;1]

%Error
coefError = norm(coeffs-trueCoeffs)




%% Here's some data

x = [-3.00,-2.20,-1.70,-1.50,-1.30, ...
     -1.00,-0.70,-0.40,-0.25,-0.05, ...
      0.07, 0.15, 0.30, 0.65, 1.10, ...
      1.25, 1.80, 2.50];
y = [-0.20, 0.10, 0.05, 0.20, 0.40, ...
      1.00, 1.20, 1.40, 1.80, 2.20, ...
      2.10, 1.60, 1.50, 1.10, 0.80, ...
      0.30,-0.10, 0.20];
close all
hold off
figure
plot(x,y,'ko')


%% Kinda looks Gaussian f(x) = a1*e^(-a2*x^2)


%Define a Gaussian function whose variables are the coefficient
%vector (A = [a1 a2]) and x. (Use the exp() function and call the 
%elements of A explicitly.)
f = @(A,x) ______________________



%Look up the documentation for lsqcurvefit. Find the 
%coefficients, "coefs" below, that solves the least squares
%problem given the data (x and y) from above. You should
%call lsqcurvefit with 4 inputs. All of them should be
%obvious except x0. We'll use A = [a1 a2] as our x0 where
%a1 = 1 and a2 = 1.
coefs = lsqcurvefit_____________


%Complete the code so that your f (from above) with the coefficients
%we just found is plotted on top of the data points in red. 
%You should use the coefficients we just found to do that.
hold on
plot(______,______,'_____')


