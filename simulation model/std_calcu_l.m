function [after_x] = std_calcu_l(row,column,X,M,N)
% ������ά�ŵ�ͼ���ݵĹ̶����ڱ�׼��
%   X1: ͼ�κ�����
%   Y1��ͼ��������
%   X��������   
%   M&N�����ڴ�С M��N

%     row = size(X1,1); %��
%     column = size(Y1,1);%��
%     after_x = zero((row - M),(column - N));

    for i = 1:(row - M)
       for j = 1:(column - N)
          after_x(i,j) = std2( X(i:i+M , j:j+N) ); 
       end
    end

end

