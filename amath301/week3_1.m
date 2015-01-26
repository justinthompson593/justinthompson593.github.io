clear all;close all;clc

%%

format long


% An example that both Jacobi and Gauss-Seidel will fail
A = [ 4  1 -1; ...
      2  2  5; ...  % The (2,3) rows can be swapped to make the methods work.
     -1  3  1]

%Uncomment to try with rows swapped
% A = A([1 3 2],:)
 
 b = [ 5; ...
      1; ...
     -4]
 
%Since we swap the rows of A, 
%swap rows of b
% b = b([1 3 2])

%Get "true" solution
xTrue = A\b

%% Jacobi method

% A = D + R     (diagonal + remainder)
A
D = diag(diag(A))
R = A - D

% Then just substitute into Ax = b
%       Ax = b
%   (D+R)x = b
%  Dx + Rx = b
%       Dx = b - Rx 
%        x = inv(D)*(b - Rx)
%        x = D \ (b - R*x)          (in matlab)

%Get initial x
xJacobi = zeros(3,1);

%Set tolerance
tol = 1e-4;

for i=1:100
   
    %Record old for comparison later
    xold = xJacobi;
   
    %Do iterative scheme
    xJacobi = D\(b - R*xJacobi);
   
    %Compare and stop if tolerance is met
    if norm(xJacobi-xold,inf) < tol
       break; 
    end
   
end


xJacobi

JacobiError = norm(xTrue - xJacobi)

%% Gauss-Seidel method

% A = L + U     (lower + upper)

%**********************NOTE************************
% DO NOT confuse these L & U with the L & U you
% get from lu-decomposition with the lu() function.
% The ONLY reason these are named "L" and "U" here
% is to help you remember that one is lower and the
% other is upper (triangular).
%**************************************************

% A = L + U     (lower + upper)
A
L = tril(A)
U = A - L


% Then just substitute into Ax = b
%       Ax = b
%   (L+U)x = b
%  Lx + Ux = b
%       Lx = b - Ux 
%        x = inv(L)*(b - Ux)
%        x = L \ (b - U*x)          (in matlab)

%Get initial x
xGS = zeros(3,1);
for i=1:100
   
    %Record old for comparison later
    xold = xGS;
   
    %Do iterative scheme
    xGS = L\(b - U*xGS);
   
    %Compare and stop if tolerance is met
    if norm(xGS-xold,inf) < tol
       break; 
    end
   
end


xGS

GaussSeidelError = norm(xTrue - xGS)

%% Look at eigenvalues

eigsJac = abs(eig(D\R))
eigsGS  = abs(eig(L\U))
eigsA   = abs(eig(A))

%% Another way to do it...

%This way computes exactly what we did above, but it does
%it in a more general way. 

D = diag(diag(A))
Ls = tril(A-D)
Us = A - D - Ls

eig(D\(Ls+Us))
eig((D+Ls)\Us)
eig(A)  

xJac2 = zeros(3,1);
for i=1:100
   xold = xJac2;
   xJac2 = D\(b - (Ls+Us)*xJac2);
   if norm(xJac2-xold,inf)<1e-4, break; end
end
xJac2

xGS2 = zeros(3,1);
for i=1:100
   xold = xGS2;
   xGS2 = (D+Ls)\(b-Us*xGS2);
   if norm(xGS2-xold,inf)<1e-4, break; end
end
xGS2

%%
% Different solvers behave differently.
bicg(A,b);
cgs(A,b);
bicgstab(A,b);
pcg(A,b);
lsqr(A,b);

