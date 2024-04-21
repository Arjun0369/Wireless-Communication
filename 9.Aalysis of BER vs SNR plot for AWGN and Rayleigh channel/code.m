clear all; 
close all; 
clc; 
snr=-4:2:10; 
snr_linear=10.^(snr/10);
ber_awgn_exact=qfunc(sqrt(snr_linear)); 
ber_awgn_approx=0.5*exp(-snr_linear./2); 
ber_rayleigh_exact=(0.5-0.5*sqrt(snr_linear./(snr_linear+2))); 
figure; 
semilogy(snr,ber_awgn_exact,':','linewidth',3) 
title("Awgn Exact and Approx Ber and Rayleigh"); 
xlabel("SNR"); 
ylabel("BER"); 
hold on 
semilogy(snr,ber_awgn_approx,'--') 
hold on 
semilogy(snr,ber_rayleigh_exact,'g') 
legend("AWGN exact","AWGN approx","Rayleigh exact"); 
