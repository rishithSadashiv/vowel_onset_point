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

Speech_Rate = 1;
[G,Gd]= gausswin((800/Speech_Rate)+1,(133/Speech_Rate)+1);
Gd_flipped = fliplr(Gd);

figure(2);
a(1) = subplot(311);
plot(G);
hold on;
a(2) = subplot(312);
plot(Gd);
hold on;
a(3) = subplot(313);
plot(Gd_flipped);
linkaxes([a(1), a(2), a(3)],'x');


[EVIvlrop_he1_vep,EVIvlrop_zf1_vep,total_vlrop1_vep, vlrop1_vep, PP1_vep, EVIvlrop1_vep]=VLR_vlrop_vlrep_v2_vep(d',1);
figure(3);
a(1) = subplot(311);
plot(t1,speech1,'k');
hold on;
plot(t1,PP1);
a(2) = subplot(312);
plot(t1,speech1,'k');
hold on;
plot(t1,PP1_vep);
a(3) = subplot(313);
plot(t1,EVIvlrop1_vep);
hold on;
plot(t1,PP1_vep);
linkaxes([a(1), a(2), a(3)],'x');

