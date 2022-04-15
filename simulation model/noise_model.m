clear,clc,close all;

% load("data3");%原始数据存储格式：y x △T B1x B1y B1z 
% actX = data3(:,1);
% actY = data3(:,2);
% actZ = data3(:,3);
% ax = 1;ay = 1;
% 
% % y1 = data1(:,1);%y轴向
% % x1 = data1(:,2);%x轴向
% 
% [X1,Y1,T_M] = gridData(actX,actY,actZ);% △T  数据网格化 400*400
% pictDraw(T_M,"磁异常曲线");
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


load("T_M");
load("X1");
load("Y1");
ax = 1;ay = 1;
pictDraw(T_M,"仿真磁异常曲线");


% % 添加噪声
% T1 = awgn(T_M,10, 'measured'); % 26   5%； 20  10%；10.4576  30% 如果sigpower是数值，则其代表以dBW为单位的信号强度；如果sigpower为‘measured’，则函数将在加入噪声之前测定信号强度
% pictDraw(T1,"叠加噪声后的磁异常曲线");

% 添加粉红噪声
[noise,T1]= smulinkSignal(T_M,26);
pictDraw(T1,"MAS of superimposed 5% Colored noise");

T_cul = InterpolationCut(T1,5,2);
pictDraw(T_cul,"插值切割后的磁异常曲线");

wname='sym3';lev=3;
T_wt = waveletThreshold(T1,wname,lev);
pictDraw(T_wt,"小波阈值去噪算法的磁异常曲线");

% [UN_MSE,UN_NC] = noiseEvalu(T_M,T_M);%无噪
% [MSE,NC] = noiseEvalu(T_M,T1);%有噪
% [IC_MSE,IC_NC] = noiseEvalu(T_M,T_cul);%插值切割降噪
% [WT_MSE,WT_NC] = noiseEvalu(T_M,T_wt);%小波阈值降噪
% 
% a = min(min(T_wt));
% b = max(max(T_wt));


Tz = VDT(T_cul,ax,ay);
[Tx,Ty] = HDT(T_cul,ax,ay);


VD=Tz;
pictDraw(VD,"VD");


THD=sqrt(Tx.^2+Ty.^2);
pictDraw(THD,"THD");

M = 5; N = 5;
after_x = std_calcu(X1,Y1,Tx,M,N);
after_y = std_calcu(X1,Y1,Ty,M,N);
after_z = std_calcu(X1,Y1,Tz,M,N);

NSTD = after_z ./ (after_x + after_y + after_z);
pictDraw(NSTD,"NSTD");

after_thd = std_calcu(X1,Y1,THD,M,N);
NFSD = after_z ./ (after_thd + after_z);
pictDraw(NFSD,"NFSD");

