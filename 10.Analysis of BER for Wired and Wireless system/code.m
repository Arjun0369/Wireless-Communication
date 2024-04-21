%  Code : for AWGNchannel
 clc
 clear all
 close all
 N=10^6;
 ip=rand(1,N)>0.5;
 s=2*ip-1;
 n=1/sqrt(2)*[randn(1,N)+j*randn(1,N)];
 Eb_N0_db=[-3:10];
 for ii=1:length(Eb_N0_db)
 y=s+10^(-Eb_N0_db(ii)/10)*n;
 ipHat=real(y)>0;
 nErr(ii)=size(find([ip-ipHat]),2);
 end
 simber=nErr/N;
 close all
 figure
 semilogy(Eb_N0_db,simber,'mx-');
 grid on
 xlabel("Eb/No, dB");
 ylabel("BER");
 title("BER V/S SNR");