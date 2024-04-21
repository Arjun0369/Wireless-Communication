close all;
 clear all;
 clc;
 do=100;
 PL_do=60;
 d=1:0.1:1000;
 n=[2,3.5,5,1.8,6,3];
 
 %Log Distance model
 PL1= PL_do+ 10*n(1)*log10(d/do);
 PL2= PL_do+ 10*n(2)*log10(d/do);
 PL3= PL_do+ 10*n(3)*log10(d/do);
 PL4= PL_do+ 10*n(4)*log10(d/do);
 PL5= PL_do+ 10*n(5)*log10(d/do);
 PL6= PL_do+ 10*n(6)*log10(d/do);
 
 figure;
 plot(d,PL1,d,PL2,d,PL3,d,PL4,d,PL5,d,PL6,'linewidth',1.4);
 legend('n=2','n=3.5','n=5','n=1.8','n=6','n=3');
 xlabel('Distance (m)');
 ylabel('PL (dBm)');
 title('Log Distance Shadowing Model');
 
 %Log Normal Distance model
 Xo = abs(randn)*6;
 PLN1= PL_do+ 10*n(1)*log10(d/do)+Xo;
 PLN2= PL_do+ 10*n(2)*log10(d/do)+Xo;
 PLN3= PL_do+ 10*n(3)*log10(d/do)+Xo;
 PLN4= PL_do+ 10*n(4)*log10(d/do)+Xo;
 PLN5= PL_do+ 10*n(5)*log10(d/do)+Xo;
 PLN6= PL_do+ 10*n(6)*log10(d/do)+Xo;

 figure;
 plot(d,PLN1,d,PLN2,d,PLN3,d,PLN4,d,PLN5,d,PLN6,'linewidth',1.4);
 legend('n=2','n=3.5','n=5','n=1.8','n=6','n=3');
 xlabel('Distance (m)');
 ylabel('PL (dBm)');
 title('Log Normal Shadowing Model');
 
 %Log Normal Shadowing Model vs Log Distance Shadowing Model
 figure;
 plot(d,PLN1,'--',d,PLN2,'--',d,PLN3,'--',d,PL1,d,PL2,d,PL3,'linewidth',1.4);
 legend('n=2 (LN)','n=3.5 (LN)','n=5 (LN)','n=2 (LD)','n=3.5 (LD)','n=5 (LD)');
 xlabel('Distance (m)');
 ylabel('PL (dBm)');
 title('Log Normal Shadowing Model vs Log Distance Shadowing Model');