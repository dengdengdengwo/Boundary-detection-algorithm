clear,clc,close all;
% Verification of denoising effect

c= [0.01,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5];
m = 20*log10(1./c);



load("T_M");
load("X1");
load("Y1");
ax = 1;ay = 1;
% pictDraw(T_M,"仿真磁异常曲线");


T1 = awgn(T_M,20, 'measured'); %26   5%； 20  10%；10.4576  30% 如果sigpower是数值，则其代表以dBW为单位的信号强度；如果sigpower为‘measured’，则函数将在加入噪声之前测定信号强度
pictDraw(T1,"叠加噪声后的磁异常曲线");
pictDraw(T1-T_M,"高斯白噪声");


[noise,output]= smulinkSignal(T_M,20);
pictDraw(noise,"生成固定SNR粉红噪声");
pictDraw(output,"叠加固定SNR粉红噪声的磁异常信号");


T_cul = InterpolationCut(output,5,2);
pictDraw(T_cul,"interpolation cut method");

wname='sym3';lev=3;
T_wt = waveletThreshold(output,wname,lev);
pictDraw(T_wt,"wavelet threshold noise reduction");
% 
% % [UN_MSE,UN_NC] = noiseEvalu(T_M,T_M);%无噪
% % [MSE,NC] = noiseEvalu(T_M,T1);%有噪
% [IC_MSE,IC_NC] = noiseEvalu(T_M,T_cul);%插值切割降噪
% [WT_MSE,WT_NC] = noiseEvalu(T_M,T_wt);%小波阈值降噪
% 
% a = min(min(T_M));
% b = max(max(T_M));
