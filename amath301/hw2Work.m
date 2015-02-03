clear all;close all;clc

%% Q1 a,b

%(a) Method 1
A1 = [];
for i = 1:10101010101

    n = i+1;
    
    condNum = cond(hilb(n),Inf);
    
    if condNum > 1e16
        break;
    else
        A1 = [A1; condNum];
        nMax = n;
    end
    
    
end
A1_1 = A1; 

%(a) Method 2
cnum = []; nmax2=1;
while 1
  c0 = cond(hilb(nmax2+1),Inf);
  if c0 > 1e16, break; end
  cnum = [cnum ; c0];
  nmax2=nmax2+1;
end

A1_2 = cnum;

error_method_1_2 = norm(A1_1 - A1_2)

nMax_method1 = nMax
nMax_method2 = nmax2

%%
%(b) Method 1

A2 = zeros(nMax-1,2);

for i = 1:size(A2,1)
   
    n = i + 1;
   
    z_n = ones(n,1);
   
    %This didn't work in class because I had A(i,1) here
    %and not A2(i,1) and so on. 
    A2(i,1) = norm( z_n - hilb(n)\(hilb(n)*z_n) ,Inf);
    A2(i,2) = norm( z_n - hilb(n)*(hilb(n)\z_n),Inf);

end


A2_1 = A2;

%(b) Method 2
err = [];
for i=2:nmax2
  z = ones(i,1);
  err = [err ; norm(z - hilb(i)\(hilb(i)*z),Inf) ...
               norm(z - hilb(i)*(hilb(i)\z),Inf)];
end

A2_2 = err;

error_method_1_2 = norm(A2_1 - A2_2)

%% Q2 a,b,e

%Ax=b

A = [ 4 -1 -1  0  0  0  0  0  0  0; ...
     -1  5 -1 -1 -1  0  0  0  0  0; ...
     -1 -1  5  0 -1 -1  0  0  0  0; ...
      0 -1  0  5 -1  0 -1 -1  0  0; ...
      0 -1 -1 -1  6 -1  0 -1 -1  0; ...
      0  0 -1  0 -1  5  0  0 -1 -1; ...
      0  0  0 -1  0  0  4 -1  0  0; ...
      0  0  0 -1 -1  0 -1  5 -1  0; ...
      0  0  0  0 -1 -1  0 -1  5 -1; ...
      0  0  0  0  0 -1  0  0 -1  4];
b = [ 0  0  0  0  0  0  1  1  1  1]';

%(a)
 A4 = A \ b;
%%
%(b) Method 1
A5 = zeros(10,2);

p0 = zeros(10,1);
p0(1) = 1;

A5(:,1) = p0;

%Jacobi is A = D + R
D = diag(diag(A));
R = A - D;

for i = 1:1010101010
   
%     xOld = A5(:,i);
    
    A5(:,i+1) = D\( b - R*A5(:,i));
    
    if norm( A5(:,i) - A5(:,i+1),Inf) < 1e-4
        break;
    end
    
end


%(b) Method 2
D = diag(diag(A));
Ls = tril(A-D);
Us = A-D-Ls;
x = [1 0 0 0 0 0 0 0 0 0]';
while 1
  x = [x  D\(b-(Ls+Us)*x(:,end))] ;
  if norm(x(:,end-1)-x(:,end),inf)<=1e-4
    break
  end
end

A5_1 = A5;
A5_2 = x;

error_methods_1_2 = norm(A5_1-A5_2)

%%
%(e) Make M
M = [0 4 4 0 0 0 0 0 0 0; ...
     2 0 4 4 6 0 0 0 0 0; ...
     2 4 0 0 6 4 0 0 0 0; ...
     0 4 0 0 6 0 2 4 0 0; ...
     0 4 4 4 0 4 0 4 4 0; ...
     0 0 4 0 6 0 0 0 4 2; ...
     0 0 0 4 0 0 0 4 0 0; ...
     0 0 0 4 6 0 2 0 4 0; ...
     0 0 0 0 6 4 0 4 0 2; ...
     0 0 0 0 0 4 0 0 4 0];
ind = find(M~=0);
M(ind)=1./M(ind);

%Look at it
M 

%Sum along 1st dim to check!
sum(M,1)

%%
[V D] = eig(M) %What's the relationship between D(2,2)
               %and V? 


%% Q3 a(i),a(iii)

%Info
t = [-90:10:110]';
N = [  7.24;  9.64; 12.87; 17.07; 23.19; ...
      31.44; 38.56; 50.19; 62.98; 76.21; ...
      92.23;106.02;123.20;132.16;151.33; ...
     179.32;203.30;226.54;248.71;281.42; ...
     307.75];

%a(i) Method 1
y = log(500./N-ones(size(N)));
A9_1 = polyfit(t,y,1)

%a(i) Method 2
y = log(500./N-1);
A9_2 = polyfit(t,y,1)

error_methods_1_2 = norm(A9_1 - A9_2)
    

%%
%a(iii)
p = A9_1;

tp = 120:10:300;
y1 = polyval(p,tp)';
A11 = 500./(1+exp(y1));

%% Q4 a,b

%(a)
p = polyfit(t,N,length(t)-1);
t3 = [-90:110]';
A14 = polyval(p,t3);

%(b)
A15 = interp1(t,N,t3);

%% Q3 b(i),b(ii) 

%b(i)
f = @(x,t) x(3) ./ (1 + x(2)*(exp(-x(1).*t)));
A12 = lsqcurvefit(f,[0.01,1,500],t,N);

%b(ii)
A13 = f(A12,tp)';