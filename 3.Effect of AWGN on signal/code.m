 %to study impact of awgn on signal in matlab
 clear all;
 close all;
 clc;
 Fs = 1000;
 T =1;
 t = 0:1/Fs:T-1/Fs;
 f_signal = 10;
 A_signal = 1;
%  signal = A_signal * (2*pi*f_signal*t); % for ramp
%  signal = A_signal * sin(2*pi*f_signal*t); %for sine
 signal = A_signal * square(20*t); %for square
 SNR_dB = 1;
 SNR_dB1 = 20 ;
 SNR_dB2 =-10 ;
 noise_power = var(signal) /(10^(SNR_dB/10));
 noise = sqrt(noise_power) * randn(size(t));
 noise_power1 = var(signal) /(10^(SNR_dB1/10));
 noise1 = sqrt(noise_power) * randn(size(t));
 noise_power2 = var(signal) /(10^(SNR_dB2/10));
 noise2 = sqrt(noise_power) * randn(size(t));
 noisy_signal = signal + noise;
 noisy_signal1 = signal + noise1;
 noisy_signal2 = signal + noise2;
 figure;
 subplot(2,3,1)
 plot(t,signal, 'r-', 'Linewidth', 2);
 title('ORIGINAL SIGNAL');
 xlabel('time');
 ylabel('signal');
 grid on;
 subplot(2,3,4)
 plot(t,noisy_signal, 'b-', 'Linewidth', 2);
 title('NOISY SIGNAL 1dB');
 xlabel('time');
 ylabel('noisy signal');
 grid on;
 subplot(2,3,2)
 plot(t,signal, 'r-', 'Linewidth', 2);
 title('ORIGINAL SIGNAL');
 xlabel('time');
 ylabel('signal');
 grid on;
 subplot(2,3,5)
 plot(t,noisy_signal1, 'b-', 'Linewidth', 2);
 title('NOISY SIGNAL 10dB');
 xlabel('time');
 ylabel('signal');
 grid on;
 subplot(2,3,3)
 plot(t,signal, 'r-', 'Linewidth', 2);
 title('ORIGINAL SIGNAL');
  xlabel('time');
 ylabel('signal');
 grid on;
 subplot(2,3,6)
 plot(t,noisy_signal2, 'b-', 'Linewidth', 2);
 title('NOISY SIGNAL-10 dB');
 xlabel('time');
 ylabel('signal');
 grid on;