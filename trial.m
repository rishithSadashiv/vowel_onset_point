clc;
clear all;
close all;
%%
[d,fs]=audioread('./merged/merged/10115.wav');%%115
d=d(:,1);
d=resample(d,8000,fs);
fs=8000;
d=d-mean(d);
d=d./max(abs(d));

t1=(1:1:length(d'))./fs;
[EVIvlrop_he1,EVIvlrop_zf1,total_vlrop1, vlrop1, PP1, EVIvlrop1]=VLR_vlrop_vlrep_v2(d',1);

time_n1 = 1/fs;
time_n2 = length(d')/fs;

t1= t1(time_n1*fs:time_n2*fs);
t1 = (1:length(t1))./fs;

speech1 = d';

speech1 = speech1(time_n1*fs:time_n2*fs);

EVIvlrop1 = EVIvlrop1(time_n1*fs:time_n2*fs);
% EVIvlrop11 = EVIvlrop11(time_n1*fs:time_n2*fs);
PP1 = PP1(time_n1*fs:time_n2*fs);
% PP11 = PP11(time_n1*fs:time_n2*fs);

figure(1);
a(1) = subplot(121);
plot(t1,speech1,'k');
hold on;
% plot(t1,-stgrlabel1,'k');
% hold on;
plot(t1,PP1);
a(2) = subplot(122);
plot(t1,EVIvlrop1);
hold on;
plot(t1,PP1);


linkaxes([a(1), a(2)],'x');



