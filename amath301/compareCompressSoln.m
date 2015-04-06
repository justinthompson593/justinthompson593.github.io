function [ out1, out2 ] = compareCompressSoln( fileName , threshold)

%Given any image file named "fileName" and any positive real number
%"threshold," compareCompress does the following. Note that "any image"
%means that you do not know the size of the input image. This must work for
%all image files. 

%1.) Load the color image and make it a gray picture

%% your code here
Im = imread(fileName); %Now Im is our color image

gP = mean(Im,3);       %make a grayPic
%%

%2.) Take the 2-dimensional fft of the gray picture
%% your code here

ft2D = fft2(gP);


%%

%3.) Turn the gray pic into a column and take the fft of that
%% your code here
ft1D = fft(gP(:));
%%

%4.) Set values to 0 that have magnitude below threshold in both arrays 
%    from 2 and 3
%% your code here
for i = 1:size(ft2D,1)
    for j = 1:size(ft2D,2)
        
        if norm(ft2D(i,j)) < threshold
            
            ft2D(i,j) = 0;
            
        end


    end
end

for k = 1:length(ft1D)
    
    if norm(ft1D(k)) < threshold
        
        ft1D(k) = 0;
        
    end
    
end

%%

%5.) Get reconstructions for both arrays by taking the real parts of their 
%    inverse transforms

%% your code here

rec2D = real(ifft2(ft2D));
rec1D = real(ifft(ft1D));

%%

%6.) Get everyone into picture size

%% your code here

rec1D = reshape(rec1D,size(gP));

%%

%7.) For out1, return the norm of the difference of the gray picture and
%    the 2D reconstruction. Similarly for out2 and the 1D reconstruction.

%% your code here

out1 = norm(gP - rec2D);
out2 = norm(gP - rec1D);

%%

%Now see which one was "better" by running FinalReview.m and then running

%>> [errorFor2D errorFor1D] = compareCompress('cat.jpg', 10000)

%in your command window. If you got two pretty similar numbers, you should
%be good. 












end

