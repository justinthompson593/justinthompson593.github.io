clear all;close all;clc

%% GLOBALS

%Controls thickness of plot lines
lineWidth = 1.5;

%Controls size of iteration points
ptSize = 50;

%%
%{

Jacobi Iteration in 2 dimensions 

Just like we said on Friday the 10th, 
if you don't know what's going on with 
a large system or example, make up your
own and investigate.

Here's mine.
%}


A = [-2 1 ; 
      1 3];

b = [-1 ;
      3];

%{
Before we do anything, let's see what 
the system, Ax = b looks like. 

Remember that this

      Ax = b
      
Means this      
      
    [-2  1]  * [x]   =  [-1]
    [ 1  3]    [y]      [ 3]
      
      
We can multiply this out to get
      
     -2x +  y = -1
       x + 3y =  3
      
Let's just graph this system. It's 
two lines, and "solving the system" 
Ax = b, means that we want to find 
the unique point in the plane where
the two lines meet.
       

      
It's nice to write out all of the 
different forms of the system that 
we're going to use      

*****Given Form*****
Line 1:     -2x +  y = -1
Line 2:       x + 3y =  3
      
*****Plotting Form*****      
(want y as function of x)   
Line 1:      y =      2x - 1   
Line 2:      y = -(1/3)x + 1      
      
*****Jacobi Form*****      
(first want x as func of y)     
Line 1:      x = (1/2)y + (1/2)  
      
(then we want y as func of x)   
Line 2:      y =-(1/3)x +  1
%}
%% Look at the system

%Before solving, let's look at it.

L1 = @(x)  2*x - 1;
L2 = @(x) -(1/3)*x + 1;

xAxis = -3:0.01:3;

plot(xAxis,L1(xAxis),'-b','LineWidth',lineWidth);
axis([0 1 0 1])
hold on
plot(xAxis,L2(xAxis), '-g','LineWidth',lineWidth);
     
     
%%     
     
     
%Initial conditions
xOld = 1;
yOld = 1;

scatter(xOld,yOld,ptSize,'r','filled')


%%

%This info comes from blue line
%and informs the new x coord. 
xNew = (1/2)*yOld + (1/2);

%So we'll plot it on the x axis in blue
scatter(xNew,0,ptSize,'b','filled')

%%

%This info comes from green line
%and informs the new y coord. 
yNew = (-1/3)*xOld + 1;

%So we'll plot it on the y axis in green
scatter(0,yNew,ptSize,'g','filled')
%(it starts off the screen!)


%%

%We'll plot the point in red, which
%we won't see yet.
scatter(xNew,yNew,ptSize,'r','filled');



%% Iterate

close all

%New initial conditions
xOld = -2;
yOld = 4;

plot(xAxis,L1(xAxis),'-b','LineWidth',lineWidth);
axis([0 1 0 1])
hold on
plot(xAxis,L2(xAxis), '-g','LineWidth',lineWidth);


for i = 1:100

xNew = (1/2)*yOld + (1/2);

scatter(xNew,0,ptSize,'b','filled')

yNew = (-1/3)*xOld + 1;

scatter(0,yNew,ptSize,'g','filled')

scatter(xNew,yNew,ptSize,'r','filled');

sprintf('Iteration number %d ',i)
xOld = xNew 
yOld = yNew

%This will wait until
%you hit any key to continue
pause
%Hit Ctrl+C to get out!

end

%%   Now let's do 3 dimensions 

A = [4 -1 1;
     4 -8 1;
    -2  1 5];

b = [7; -21; 15];
%{

*****Given Form*****
Plane 1:     4x - y + z = 7
Plane 2:     4x -8y + z = -21
Plane 3:    -2x + y +5z = 15 
      
*****Plotting Form*****      
(want z as function of x and y)   
Plane 1:      z =    -4x +      y +  7
Plane 2:      z =    -4x +     8y - 21      
Plane 3:      z = (2/5)x - (1/5)y +  3
      

*****Jacobi Form*****
x = (1/4)*y - (1/4)*z + (7/4)
y = (1/2)*x + (1/8)*z + (21/8)
z = (2/5)*x - (1/5)*y + 3
%}

%Googling "matlab surface" got me to the
%function "surf". Google "matlab surf" or
%in the command window, run
%
%>> doc surf

%and see if you can figure out how and 
%why I'm setting this up this way.
[X Y] = meshgrid(-10:.1:10);
P1 = -4*X + Y + 7*ones(size(X));
P2 = -4*X + 8*Y -21*ones(size(X));
P3 = (2/5)*X - (1/5)*Y + 3*ones(size(X));


close all;

surf(X,Y,P1,'FaceColor','red','FaceAlpha',.5,'EdgeColor','none')
axis([-10 10 -10 10 -150 100])
hold on
surf(X,Y,P2,'FaceColor','green','FaceAlpha',.5,'EdgeColor','none')
surf(X,Y,P3,'FaceColor','blue','FaceAlpha',.5,'EdgeColor','none')



% initial conditions
xOld = -10;
yOld = 10;
zOld = -150;


for j = 1:500
%Plot location of point
scatter3(xOld,yOld,zOld,'c','filled','SizeData',70)

%Update info
xNew = (1/4)*yOld - (1/4)*zOld + (7/4); %not 7
yNew = (1/2)*xOld + (1/8)*zOld + (21/8);
zNew = (2/5)*xOld - (1/5)*yOld + 3;


%Plot new x in red on x axis, similarly y&z. 
%NOTE: Does NOT correspond to info dependency!
scatter3(xNew,0,0,'r','filled','SizeData',70)
scatter3(0,yNew,0,'g','filled','SizeData',70)
scatter3(0,0,zNew,'b','filled','SizeData',70)

%Update
sprintf('Iteration number %d ',j)
xOld = xNew
yOld = yNew
zOld = zNew

pause
end


