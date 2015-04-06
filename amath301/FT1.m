clear all;close all;clc

%{
The Fourier Transform
%}
%%

Fs = 44000;         %Sampling freq. So There are Fs samples per second
t  = 0:1/Fs:1;      %One second, from t=0 to t=1, at samp freq Fs

freq = @(n) 440*2^((n-49)/12); %The freq of the nth piano key 

%Let's listen to a couple of notes. The note A at 440 Hz is the 49th
%piano key on an 88-key piano. So, freq(49) = 440. We can make matlab
%play this note at our sampling frequency, Fs, by making a sine wave

A_at_440 = sin(2*pi*freq(49)*t); %Construct a sine wave at 440 Hz

sound(A_at_440,Fs); %Play A_at_440 at sampling frequency Fs = 44000


%Now let's make a chord.

%An "A major triad" is played by pressing the 49th, 53rd and 56th keys 
%simulatneously on the piano.
Amajor = sin(2*pi*freq(49)*t) + sin(2*pi*freq(53)*t) + sin(2*pi*freq(56)*t);

%But now we've added 3 sine waves, with ranges in [-1, 1]. So A major
%now has values in [-3, 3]. The matlab sound(input,frequency) function 
%prefers that the input vector is normalized. That is, we should make 
%the largest absolute value in Amajor equal to 1. 

%Normalize it so it's not TOO LOUD
Amajor = Amajor/max(abs(Amajor(:))); %Divide by largest magnitude element.
                                     %Now, the largest value in Amajor is 1
%% Listen to it
sound(Amajor,Fs)

%Look at the freqs we used to construct the chord
freq1 = freq(49)
freq2 = freq(53)
freq3 = freq(56)

%% Take the fft

Amajor_FT = fft(Amajor);

freqAxis = Fs/length(Amajor)*(0:length(Amajor)-1);

plot(freqAxis,abs(Amajor_FT))

%Notice that these peaks occur at freq1 = 440, freq2 = 554 and 
%freq3 = 659


                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     