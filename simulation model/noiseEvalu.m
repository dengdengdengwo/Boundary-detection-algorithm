function [MSE,NC] = noiseEvalu(T_F,T_A)
%NOISEEVALU 去噪效果评估 -- 指标：均方根误差MSE；归一化互相关度NC
%T_F:原始数据
%T_A：去噪后数据
  
% 均方根误差MSE
   [m,n] = size(T_F);
   tmp = T_F - T_A;
   MSE = sum(tmp(:).^2) / (m*n);
   
   tmp1 = T_F .* T_A;
   tmp2_1 = sum(T_F(:).^2);
   tmp2_2 = sum(T_A(:).^2);
   NC = sum(sum(tmp1)) / sqrt(tmp2_1 * tmp2_2);
    
end

