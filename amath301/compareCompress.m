function [ out1, out2 ] = compareCompress( fileName , threshold)

%Given any image file named "fileName" and any positive real number
%"threshold," compareCompress does the following. Note that "any image"
%means that you do not know the size of the input image. This must work for
%all image files. 

%1.) Load the color image and make it a gray picture

%% your code here



%%

%2.) Take the 2-dimensional fft of the gray picture
%% your code here




%%

%3.) Turn the gray pic into a column and take the fft of that
%% your code here




%%

%4.) Set values to 0 that have magnitude below threshold in both arrays 
%    from 2 and 3
%% your code here




%%

%5.) Get reconstructions for both arrays by taking the real parts of their 
%    inverse transforms

%% your code here




%%

%6.) Get everyone into picture size

%% your code here




%%

%7.) For out1, return the norm of the difference of the gray picture and
%    the 2D reconstruction. Similarly for out2 and the 1D reconstruction.

%% your code here

out1 = norm();
out2 = norm();

%%

%Now see which one was "better" by running FinalReview.m and then running

%>> [errorFor2D errorFor1D] = compareCompress('cat.jpg', 10000)

%in your command window. If you got two pretty similar numbers, you should
%be good. 











end



















