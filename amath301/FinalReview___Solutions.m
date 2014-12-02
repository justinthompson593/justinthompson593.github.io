clear all;close all;clc

%Load the image
Image = imread('cat.jpg');

%Look at it and move it so that you can see the kitty and this script.
%With all of the plots we'll do, you can drag a corner to resize the window
%to make them look better.
imagesc(Image)

%Also, look at the size of the picture in your Command Window
theSizeOfThePicture = size(Image)

%Notice that [360 360 3] = size(Image). The first two numbers, 360 & 360,
%correspond to the X and Y coordinates of the picture. Unfortunately, the X 
%indices in the picture are the second indices in "Image" and similarly
%with the other indices. We index our matrices "down" and "right" but our X
%and Y on the screen are just the opposite. 

%Select the data cursor tool (it's one of the icons above the kitty. 
%There's a black +, a blue line, and a yellow script-lookin' box) and put 
%it on the kitty's nose. When you click, it should read

%   X: 225 Y: 165
%   RGB: 173, 81, 82

%or something close. Let's take a look at the color values for the first pixel
%in the upper left of the screen. 


redVal   = Image(1,1,1) %Red is the first of the last 3 indices
greenVal = Image(1,1,2) %Green is the second of the last 3 indices
blueVal = Image(1,1,3) %Green is the second of the last 3 indices

%All 3 are maxed out at 255. This makes that pixel white. 

%So to do the same for the point on the kitty's nose, I have to flip the X
%and Y coordinates, but I should get this:

%   173 = Image(165, 225, 1)
%    81 = Image(165, 225, 2)
%    82 = Image(165, 225, 3)

%Which we can check
redNose = Image(165, 225, 1)
greenNose = Image(165, 225, 2)
blueNose = Image(165, 225, 3)

%Having approximately equal parts green and blue mixed with red at about 
%twice the intensity makes the kitten's nose adorable. 

%Don't worry about the X and Y coordinate swap. We shouldn't have to use
%that at all. What we want to do is make a new image, call it grayPic. It 
%is the average of the red, green, and blue pixel values at each point. 
%grayPic should be a 360 by 360 matrix of doubles. So, we should have 

%   112 = grayPic(165,225)

%since 112 = (173+81+82)/3. I'll get you started.
Image = double(Image);


%% make grayPic in this section

%Can do it like this:

grayPic = zeros(size(Image,1),size(Image,2)); %Make a container for our gray picture
                                              %Note its dimentions and how I accessed them  

for i = 1:size(Image,3) %Loop through 
    
    grayPic = grayPic + Image(:,:,i); %sum the individual RGB values
    
end

%Then divide by the number of iterations to get an average
grayPic = grayPic./size(Image,3);

%Or you can do it this way
grayPic2 = mean(Image,3); %Take the mean in the thrid index, which corresponds to pixels

subplot(1,2,1)
imagesc(grayPic); colormap gray
title('Method 1')
subplot(1,2,2)
imagesc(grayPic2);
title('Method 2')

%What does this tell us about the two methods?
Error = norm(grayPic - grayPic2)

%%

%Now let's take the 2-dimensional fft. This will give us an array of
%complex numbers which we'll call ftImage. 
ftImage = fft2(grayPic);

%We can do some quick image compression by throwing away (setting to zero)
%values with small complex magnitude. Remember, that's just the distance
%from the origin. So the complex number 3 + 2i is closer to the origin
%than, say, -10 + 17i. The magnitudes are given by sqrt(9+4) and
%sqrt((-10)^2+17^2). An easy way to compute this in matlab is by using the
%norm function. If z is a complex number, z = a + ib, then norm(z) gives
%you the magnitude. 

%Here's some arbitrary threshold
someArbitraryThreshold = 10000;

%Write code which goes through ftImage and sets the value to 0 if the
%magnitude is less than someArbitraryThreshold

%% Write code here

for i = 1:size(ftImage,1)
    for j = 1:size(ftImage,2)
        
        if norm(ftImage(i,j)) < someArbitraryThreshold
            %Then 
            ftImage(i,j) = 0; %set it to 0
        end
        
    end
end

%%

%Now we can "pull the image back" by taking the inverse transform. We'll
%call this the reconstruction.
 
%All the work we just did on ftImage is going to change what we get back;it
%won't be our original image. That is, we don't expect all 360x360 pixels
%to be an exact match, but they should be reasonably close. They will be,
%as we'll see below, but they'll be "reasonably close" in a complex sense. 

%Originally, all RGB channels of the first pixel were maxed out at 255.
%Since we only changed small values a (relatively) small amount, we would
%expect values like 251.7266799 and 256.01111923 in the reconstruction's
%first pixel. They're reasonably close. But so are 254.5 + 0.002i and
%253.323321 + 0.0001239i. We can almost guarantee that the reconstruction
%will not be pure real. So, after we pull the kitty back, we'll just take
%the real part.

%Use the functions "real()" and "ifft2()" to compute the real part of the
%inverse transform of ftImage. Call it recon. (This should be easy)

%% Do it here

recon = real(ifft2(ftImage));

%%

%Let's have a look
subplot(1,2,1)
imagesc(grayPic); colormap gray
title('original')
subplot(1,2,2)
imagesc(recon)
title('reconstruction')

%Note that there's nothing special about someArbitraryThreshold. It is in
%fact arbitrary. Go ahead and play with the values a little. It's fun.

%Now write code which turns our original grayPic into a column vector and
%then takes the regular fft of that column vector. Let's call this ftCol

%% make ftCol in this section

ftCol = fft(grayPic(:)); %Note that MatrixAsAColumn = Matrix(:);


%%

%In a similar manner as above, write code which sets values of ftCol to 0
%if the magnitude of that value is less than someArbitraryThreshold

%% Write code here

for i = 1:length(ftCol)
    
    if norm(ftCol(i)) < someArbitraryThreshold
        
        ftCol(i) = 0;
        
    end
    
end

%%

%Now use "real()" and "ifft()" to pull back a reconstruced column. Use
%"reshape()" to get this back to the size of the original gray image. Call
%this recon2

%% Make recon2 here

reconCol = real(ifft(ftCol));
recon2 = reshape(reconCol,size(grayPic));

%%

%Let's have a look
subplot(1,3,1)
imagesc(grayPic); colormap gray
title('original')
subplot(1,3,2)
imagesc(recon);
title('Using fft2')
subplot(1,3,3)
imagesc(recon2);
title('Using fft')

Comparison = norm(recon - recon2)


%We can see from the Comparison that these two reconstructions aren't the
%same. I wonder which one did a better job? Move on to compareCompress.m
















