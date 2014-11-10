clear all;close all;clc
%%
% The Logistic Map
%    x_{k+1} = r * x_n * (1 - x_n)     for 0 <= x_i <= 1

x0 = 1/2;       %initial condition

logMap = @(x,r) r*x.*(1-x); %the logistic map

xAxis = 0:0.01:1;

%choose initial r value
r = 3;

%plot the map
plot(xAxis, logMap(xAxis,r), 'b')
axis([0 1 0 1])
hold on

%plot y = x
plot(xAxis,xAxis,'b')

%plot the point
oldPt = [x0; 0];
scatter(oldPt(1), oldPt(2),20,'filled','r')

%get next point on map
newPt = [x0; logMap(x0,r)]
scatter(newPt(1),newPt(2),20,'filled','r')

%draw line from old to new
plot([oldPt(1) newPt(1)],[oldPt(2) newPt(2)],'r')

%draw point on y = x
