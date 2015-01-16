% Announcements
%
% 1. http://courses.washington.edu/am301/scorelator/common_problems.txt
%
% 2. Scorelator down from 3:30 to 4:30 today. New deadline at 6:30 pm tonight
%
% 3. Scorelator walkthrough?
%
% 4. Talk to me after class if you still can't log in to scorelator

% Week 2 demonstration for Section B on Friday Jan 16, 2015


%%

A = zeros(10)      % one argument for square matrix
%%
A = zeros(10, 10)  % Emphasize the good habbit for using two arguments
%%
A = ones(10)
%%
A = ones(10, 10)
%%
I = eye(7,7)
%%

% A*x = b

A = [1 3 2; 2 0 -5; 8 -2 1]

b = [1; 0; -4]

det(A)  % First thing to check
        % Mention that even with det(A) not being zero, numerical
        % error may still be important

%%        
        
cond(A)     % I mentioned cond(A) in Section B already but I
%%
cond(A,1)   % did not talk about the variants
%%
cond(A,2)
%%
cond(A,inf)
%%

% For A*x = b, backslash gives us x = A\b

x1 = A\b   % Direct solution

%%
% Actually, Matlab does this:
[L,U,P] = lu(A)

% Confirm that PA = LU
lhs = P*A
rhs = L*U

%% Look at permutation matrix action on B
P = P       %get P on the screen

B = [1 1 1;2 2 2;3 3 3] %Look at B

P_times_B = P*B %See what P did to B?

%% Why did we get that P?

A = A       %look at A

P_times_A = P*A %look at the diagonal

%Now that A is in this form, it has an LU decomp.

%%

% If someone forgets
[L1,U1] = lu(A)

%%
% U1 is still U but L1 = inv(P)*L
invP_times_L = inv(P)*L

%That is,
%{

For a square matrix A, we can get matrices P, U, and L 
such that

    P*A = L*U

You can do this by calling

    [L,U,P] = lu(A)

But if you don't call it with the P in the output and 
did something like this,

    [L2, U2] = lu(A)

then U2 = U and L2 = inv(P)*L. Thus,

    L2*U2 = inv(P)*L*U = inv(P)*P*A = I*A = A

BUT

    L*U = P*A

so watch out!!

%}


%%
% Go back to the solution
x1 = A\b

%%

x2 = U\(L\(P*b))  % identical

%% Clock it

% Efficiency of \
A = rand(1000,1000);
B = rand(1000,1000);

tic; inv(A)*B; toc;

tic; A\B; toc;  % Should be half of the previous one...meh




%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  IF YOU STILL HAVE TIME   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% We didn't get to this part, but this 
% short script is pretty clear. Just run it
% one section at a time, and the outputs
% speak for themselves. 


%% Section 1

clear all; close all;
syms a11 a12 a21 a22 b1 b2

A = [a11 a12; a21 a22]
b = [b1; b2]

%% Section 2

[L, U, P] = lu(A);

L

U

P

%% Section 3

symInv = inv(A)

symDet = det(A)

symBackslashSoln = A\b

