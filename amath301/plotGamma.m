clear all;close all;clc

% Plotting f(x) = Gamma(x+1)

%% Plot on the interval 0 <= x <= 2

x = 0:0.01:2;  %splits [0, 2] into 201 points

%%%%%% evaluateF(f,x) %%%%%%
y = zeros(size(x));

for i = 1:size(y,2)
    
    y(i) = f(x(i));
    
end
%%%%%% evaluateF(f,x) %%%%%%

plot(x,y)

%% Plot on the interval 0.2 <= x <= 0.8

x = 0.2:0.0005:0.8;  %splits [.2, .8] into 1201 points

%%%%%% evaluateF(f,x) %%%%%%
y = zeros(1,length(x));

for i = 1:length(y)
    
    y(1,i) = f(x(1,i));
    
end
%%%%%% evaluateF(f,x) %%%%%%


plot(x,y)

%% Plot on the interval .45 <= x <= .5

x = 0.45:0.00005:0.5;   %splits interval into 1001 points

%%%%%% evaluateF(f,x) %%%%%%
s = 0;
y = [];   %NOT computationally efficient
while s < size(x,2)
    
    s = s + 1;
    
    y = [y f(x(s))];
end
%%%%%% evaluateF(f,x) %%%%%%


plot(x,y)

%% Plot on the interval .461 <= x <= .462

x = linspace(0.461,0.462,2000);   %splits interval into 2000 points

%%%%%% evaluateF(f,x) %%%%%%
y = zeros(size(x,1),size(x,2));

for i = 1:size(x,1)
    for j = 1:size(x,2)
   
        y(i,j) = f(x(i,j));
        
    end
end
%%%%%% evaluateF(f,x) %%%%%%


plot(x,y)












