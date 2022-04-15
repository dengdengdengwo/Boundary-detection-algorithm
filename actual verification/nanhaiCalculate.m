clear,clc,close all;
% Aeromagnetic data verification

load('X1');%Actual aeromagnetic data
load('Y1');%Actual aeromagnetic data
load('T_M');%Actual aeromagnetic data
ax = 1;ay = 1;
I_d = 45; 
D_d = -2; 
pictDrawN(T_M,"¥≈“Ï≥£«˙œﬂ");


T_M = huaji(T_M,ax,ay,I_d,D_d);
pictDrawN(T_M,"reduction-to-the-pole of MAS");

T_cul = InterpolationCut(T_M,5,2);
pictDrawN(T_cul,"Noise reduction effect");

Tz = VDT(T_cul,ax,ay);  
[Tx,Ty] = HDT(T_cul,ax,ay);


VD=Tz;
pictDrawN(VD,"VD");


THD=sqrt(Tx.^2+Ty.^2);
pictDrawN(THD,"THD");

M = 5; N = 5;

after_x = std_calcu(X1,Y1,Tx,M,N);
after_y = std_calcu(X1,Y1,Ty,M,N);
after_z = std_calcu(X1,Y1,Tz,M,N);

NSTD = after_z ./ (after_x + after_y + after_z);
pictDrawN(NSTD,"NSTD");

after_thd = std_calcu(X1,Y1,THD,M,N);
NFSD = after_z ./ (after_thd + after_z);
pictDrawN(NFSD,"NFSD");

