function [after_x] = std_calcu_l(row,column,X,M,N)
% 计算三维磁地图数据的固定窗口标准差
%   X1: 图形横坐标
%   Y1：图形纵坐标
%   X：待求量   
%   M&N：窗口大小 M行N

%     row = size(X1,1); %行
%     column = size(Y1,1);%列
%     after_x = zero((row - M),(column - N));

    for i = 1:(row - M)
       for j = 1:(column - N)
          after_x(i,j) = std2( X(i:i+M , j:j+N) ); 
       end
    end

end

