clear,clc,close all;
% Verification of denoising effect

c= [0.01,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5];
m = 20*log10(1./c);



load("T_M");
load("X1");
load("Y1");
ax = 1;ay = 1;
% pictDraw(T_M,"������쳣����");


T1 = awgn(T_M,20, 'measured'); %26   5%�� 20  10%��10.4576  30% ���sigpower����ֵ�����������dBWΪ��λ���ź�ǿ�ȣ����sigpowerΪ��measured�����������ڼ�������֮ǰ�ⶨ�ź�ǿ��
pictDraw(T1,"����������Ĵ��쳣����");
pictDraw(T1-T_M,"��˹������");


[noise,output]= smulinkSignal(T_M,20);
pictDraw(noise,"���ɹ̶�SNR�ۺ�����");
pictDraw(output,"���ӹ̶�SNR�ۺ������Ĵ��쳣�ź�");


T_cul = InterpolationCut(output,5,2);
pictDraw(T_cul,"interpolation cut method");

wname='sym3';lev=3;
T_wt = waveletThreshold(output,wname,lev);
pictDraw(T_wt,"wavelet threshold noise reduction");
% 
% % [UN_MSE,UN_NC] = noiseEvalu(T_M,T_M);%����
% % [MSE,NC] = noiseEvalu(T_M,T1);%����
% [IC_MSE,IC_NC] = noiseEvalu(T_M,T_cul);%��ֵ�и��
% [WT_MSE,WT_NC] = noiseEvalu(T_M,T_wt);%С����ֵ����
% 
% a = min(min(T_M));
% b = max(max(T_M));
