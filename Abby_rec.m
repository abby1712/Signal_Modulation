clc; 
close all; 
clear;
A = input('Enter the Amplitude of the carrier Wave: ');
Fc = 10000;     % hertz 
Fs = 35000;    % hertz 
x = input('Enter the recording Time: ');   %SECONDS
dt = 1/Fs;                               % seconds per sample
StopTime = x;            
t = (0:dt:StopTime-dt)'; 
N=size(t,1);

%% Carrier Wave
Carrier = (A*cos(2*pi*Fc*t)');
%% Signal Wave = Recorded Voice signal

recObj = audiorecorder(Fs,16,1);         
disp('Start speaking.')
recordblocking(recObj, x);
disp('End of Recording.');
Input_Signal=(getaudiodata(recObj))';


%% Plotting Of Signal
display(' Now playing Input Message.....')
subplot(4,1,1)
plot(t,Input_Signal);
title('Time Domain Representation of Input Signal');  
xlabel('Time');
ylabel('Magnitude');
sound(Input_Signal,Fs,8);
pause(x);
%% Plotting Of Carrier Wave
subplot(4,1,2)
plot(t(1:100),Carrier(1:100));
title('Time Domain Representation of Carrier Wave');  
xlabel('Time');
ylabel('Magnitude');

%% Modulation of Wave
Modulated_Signal = ammod(Input_Signal,Fc,Fs);
subplot(4,1,3)
plot(Modulated_Signal)
display(' Now playing Modulated Message....')
sound(Modulated_Signal,Fs,8);
title('Time Domain Representation of Modulated Wave');  
xlabel('Time');
ylabel('Magnitude');
pause(x);

%% Demodulation of Wave
display(' Now playing Demodulated Message.....')
DeModulated_Signal = amdemod(Modulated_Signal,Fc,Fs);
subplot(4,1,4)
plot(DeModulated_Signal)
sound(DeModulated_Signal,Fs,8);
title('Time Domain Representation of Demodulated Wave');  
xlabel('Time');
ylabel('Magnitude');
