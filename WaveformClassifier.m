load('data.mat');


m = size(waveform,1);
steps = m-1;
dt = 1/steps;
IsDerPos = true; %is derivative positive
PreDer = IsDerPos; % previous derivative
derChangeTimes = [];


%calculate the frequency & amplitude
for i = 1:m-1
    if ((waveform(i)-waveform(i+1))/dt) >0 %checking derivative is positive
        IsDerPos = true;
        
    elseif ((waveform(i)-waveform(i+1))/dt) <0
        IsDerPos = false;
    end
    
    if PreDer ~= IsDerPos   %if previous derivative not equal to the derivative
        PreDer = IsDerPos;  
        derChangeTimes = [derChangeTimes, i];
    end
end

n = size(derChangeTimes,2);

amplitudes = [n-1];
halfCycleTime = [n-1];

for j = 1:n-1
    halfCycleTime(j) = derChangeTimes(j+1)-derChangeTimes(j);
    
end
   


frequency = (1/(2*dt*(mean(halfCycleTime))))/t(m);
amplitude = waveform(derChangeTimes(2),1);


%re-genarate waveforms
time = (0:dt*t(m):t(m))';
sin_wave = amplitude*sin(2*pi*frequency*time);
square_wave = amplitude*square(2*pi*frequency*time); 
sawtooth_wave = amplitude*sawtooth(2*pi*frequency*time);     
    
    
% checking error    
sin_wave_error = 0;
square_wave_error = 0;
sawtooth_wave_error = 0;



sin_wave_error = sum((waveform-sin_wave).^2)/(2*m)
square_wave_error = sum((waveform-square_wave).^2)/(2*m)
sawtooth_wave_error = sum((waveform-sawtooth_wave).^2)/(2*m)

errors = [sin_wave_error,square_wave_error,sawtooth_wave_error]
[Error,Index] = min(errors)

if Index == 1
    fprintf('Input Signal is a sin wave,  Frequency is %4.5f, Amplitude is %4.5f, Computational Error is %4.5f',frequency, amplitude, Error);
elseif Index ==2
    fprintf('Input Signal is a Square wave,  Frequency is %f, Amplitude is %f, Computational Error is %f',frequency, amplitude, Error);
elseif Index == 3
    fprintf('Input Signal is a Sawtooth wave,  Frequency is %f, Amplitude is %f, Computational Error is %f',frequency, amplitude, Error);
end

     
    