function [MSE,NC] = noiseEvalu(T_F,T_A)
%NOISEEVALU ȥ��Ч������ -- ָ�꣺���������MSE����һ������ض�NC
%T_F:ԭʼ����
%T_A��ȥ�������
  
% ���������MSE
   [m,n] = size(T_F);
   tmp = T_F - T_A;
   MSE = sum(tmp(:).^2) / (m*n);
   
   tmp1 = T_F .* T_A;
   tmp2_1 = sum(T_F(:).^2);
   tmp2_2 = sum(T_A(:).^2);
   NC = sum(sum(tmp1)) / sqrt(tmp2_1 * tmp2_2);
    
end

