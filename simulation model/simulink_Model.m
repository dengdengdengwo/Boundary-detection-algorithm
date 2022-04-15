clear,clc,close all;
% Simulation verification of multi-target and altitude difference

load("data3");%data format£ºy x ¡÷T B1x B1y B1z 
actX1 = data3(:,1);
actY1 = data3(:,2);
actZ1 = data3(:,3);

load("data33");
actX2 = data33(:,1);
actY2 = data33(:,2);
actZ2 = data33(:,3);

ax = 1;ay = 1;
y1 = data3(:,1);%y
x1 = data3(:,2);%x

[X1,Y1,T_M] = gridData(actX1,actY1,actZ1,400);% ¡÷T 400*400
[X2,Y2,T_M2] = gridData(actX2,actY2,actZ2,480);% ¡÷T 480*480
pictDraw(T_M,"magnetic anomaly signals");


Tz = VDT(T_M,ax,ay); 
[Tx,Ty] = HDT(T_M,ax,ay);


VD=Tz;
pictDraw(VD,"VD");


THD=sqrt(Tx.^2+Ty.^2);
pictDraw(THD,"THD");


M = 5; N = 5;
Tz2 = VDT(T_M2,ax,ay);  
[Tx2,Ty2] = HDT(T_M2,ax,ay);


VD2=Tz2;
THD2=sqrt(Tx2.^2+Ty2.^2);


after_x = std_calcu(X2,Y2,Tx2,M,N);
after_y = std_calcu(X2,Y2,Ty2,M,N);
after_z = std_calcu(X2,Y2,Tz2,M,N);

NSTD = after_z ./ (after_x + after_y + after_z);
pictDrawN(NSTD,"NSTD");

after_thd = std_calcu(X2,Y2,THD2,M,N);
NFSD = after_z ./ (after_thd + after_z);
pictDrawN(NFSD,"NFSD");
