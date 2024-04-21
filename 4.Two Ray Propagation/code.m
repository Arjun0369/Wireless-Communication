clear all;
close all;
clc;
freq=9*10^8; % freq 2 :18*10^7 
d=1:0.1:100000;
ht=50; % height of tx antenna (m) 
hr=2; % height of rx antenna (m) 
Gref=1;
Glos=1;
Pt=10^-3; %Transmitted power in W %two ray ground reflection model
dlos=sqrt(d.^2+(ht-hr)^2);
dref=sqrt((d.^2+(ht+hr)^2));
lamda=3*10^8/freq;
gamma=-1;
phi=(2*pi*(dref-dlos))/lamda;
Pr=Pt*(lamda/4*pi)^2 * abs ((sqrt(Glos)./dlos)+(gamma*sqrt(Gref)*exp(-sqrt(- 1)*phi))./dref).^2;
figure;
semilogx(d,Pr);
Pr_db=10*log(Pr);
xlabel("Distance");
ylabel("Power");
title("Received Power V/S Distance");
figure;
semilogx(d,Pr_db);
xlabel("Distance");
ylabel("Power(in dB)");
title("Received Power V/S Distance in Decibels");