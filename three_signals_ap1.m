fs = 100000; % Sampling f1requency (samples per second) 
dt = 1/fs; % seconds per sample 
StopTime = 10; % seconds 
t = (0:dt:StopTime)'; % seconds in vectorized format

SigType = input('Enter 1 for SIN \n Enter 2 for Square \n Enter 3 for Sawtooth:\n'); 
if SigType == 1
    freq = input('Enter thee frequency:\n');
    amp = input('Enter the amplitude:\n');
    waveform = amp*sin(2*pi*freq*t);
    plot(t,waveform);
    xlabel('Time');
    ylabel('Amplitude');
    grid on
    hold on
    save('data.mat','t','waveform');
    
elseif SigType == 2
    freq = input('Enter thee frequency:\n');
    amp = input('Enter the amplitude:\n');
    waveform =amp* square(2*pi*freq*t);
    plot(t,waveform);
    xlabel('Time');
    ylabel('Amplitude');
    grid on
    hold on
    save('data.mat','t','waveform');
    
elseif SigType == 3
    freq = input('Enter thee frequency:\n');
    amp = input('Enter the amplitude:\n');
    waveform = amp*sawtooth(2*pi*freq*t);
    plot(t,waveform);
    xlabel('Time');
    ylabel('Amplitude');
    grid on
    hold on
    save('data.mat','t','waveform');
end   





