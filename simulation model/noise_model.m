clear,clc,close all;

% load("data3");%ԭʼ���ݴ洢��ʽ��y x ��T B1x B1y B1z 
% actX = data3(:,1);
% actY = data3(:,2);
% actZ = data3(:,3);
% ax = 1;ay = 1;
% 
% % y1 = data1(:,1);%y����
% % x1 = data1(:,2);%x����
% 
% [X1,Y1,T_M] = gridData(actX,actY,actZ);% ��T  �������� 400*400
% pictDraw(T_M,"���쳣����");
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


load("T_M");
load("X1");
load("Y1");
ax = 1;ay = 1;
pictDraw(T_M,"������쳣����");


% % �������
% T1 = awgn(T_M,10, 'measured'); % 26   5%�� 20  10%��10.4576  30% ���sigpower����ֵ�����������dBWΪ��λ���ź�ǿ�ȣ����sigpowerΪ��measured�����������ڼ�������֮ǰ�ⶨ�ź�ǿ��
% pictDraw(T1,"����������Ĵ��쳣����");

% ��ӷۺ�����
[noise,T1]= smulinkSignal(T_M,26);
pictDraw(T1,"MAS of superimposed 5% Colored noise");

T_cul = InterpolationCut(T1,5,2);
pictDraw(T_cul,"��ֵ�и��Ĵ��쳣����");

wname='sym3';lev=3;
T_wt = waveletThreshold(T1,wname,lev);
pictDraw(T_wt,"С����ֵȥ���㷨�Ĵ��쳣����");

% [UN_MSE,UN_NC] = noiseEvalu(T_M,T_M);%����
% [MSE,NC] = noiseEvalu(T_M,T1);%����
% [IC_MSE,IC_NC] = noiseEvalu(T_M,T_cul);%��ֵ�и��
% [WT_MSE,WT_NC] = noiseEvalu(T_M,T_wt);%С����ֵ����
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

