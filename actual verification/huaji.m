function v_temp = huaji(T_a,ax,ay,I_d,D_d)
%化极计算
% ａｘ、ａｙ 分别为ｘ、ｙ方向网格数据间隔  点距 和 线距
% ｄｕ、ｄｖ分别为ｘ、ｙ方向基频
%v_temp 化极后的磁异常


% 扩边
% [n2,m2] = size(T_a); 
[temp4,n2,m2,cl1,cl2,rl1,rl2] = largeMat(T_a); %n行 m列

% 快速傅里叶变换
 H1 = fftshift(fft2(temp4));
  
% 垂向导数频域转换因子
du = 1 / (m2*ax);dv= 1 / (n2*ay); %基频
I = deg2rad(I_d);
D = deg2rad(D_d);
a0 = cos(I)*cos(D);
B0 = cos(I)*sin(D);
r0 = sin(I);

vfs = zeros(n2,m2);
for k  = 1:1:n2 %列
    for j = 1:1:m2  %行
        if k ~=(n2/2+1) || j ~= (m2/2+1)
            u = (j - (m2/2+1))*du ; 
            v = (k - (n2/2+1))*dv;
            qv = ( u^2 + v^2)/(u*a0*1i + v*B0*1i + sqrt(u^2+v^2)*r0)^2; %化极算子
            vfs(k,j) = H1(k,j)*qv;
            vfs((n2/2+1),(m2/2+1)) = vfs((n2/2+1),(m2/2+1)) - vfs(k,j);
        end
    end
end
      
  % 反傅里叶变换
 vl = real(ifft2(fftshift(vfs)));
  
%  缩编
v_temp = vl(cl1+1:n2-cl2,rl1+1:m2-rl2);
end



