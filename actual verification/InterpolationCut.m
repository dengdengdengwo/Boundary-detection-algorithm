function [T] = InterpolationCut(T,count,r)
%INTERPOLATIONCUT 插值切割去噪算法
% T 含噪声信号
% count 设定的迭代次数
% r  切割半径
  
  [m,n] = size(T);
  for k = 1:1:count
      %计算A
      A = zeros(m,n);
      bx = zeros(m,n);
      by = zeros(m,n);
      Bx = zeros(m,n);
      By = zeros(m,n);
      c = zeros(m,n);
      d = zeros(m,n);
      a = zeros(m,n);
      b = zeros(m,n);
      for i = (1+r):1:(m-r)  %计算偏x导
          for j = (1+r):1:(n-r)
              A(i,j) = 0.25 .* (T(i,j+r) + T(i,j-r) + T(i+r,j) + T(i-r,j));
              bx(i,j) = T(i,j) - 0.5 .*(T(i+r,j) - T(i-r,j));
              by(i,j) = T(i,j) - 0.5 .*(T(i,j+r) - T(i,j-r));
              Bx(i,j) = T(i+r,j) - T(i-r,j);
              By(i,j) = T(i,j+r) - T(i,j-r);
              
              if (Bx(i,j) == 0) && (bx(i,j)== 0)
                c(i,j) = 1;
              else
                c(i,j) = Bx(i,j)^2 /(Bx(i,j)^2 + bx(i,j)^2);
              end
              
              if (By(i,j) == 0) && (by(i,j)== 0)
                d(i,j) = 1;
              else
                d(i,j) = By(i,j)^2 /(By(i,j)^2 + by(i,j)^2);
              end
              
              a(i,j) = 0.5 *(c(i,j)+d(i,j));
              b(i,j) = 1 - a(i,j);
          end
      end
      
      L = a .* T + b .* A;
      T = L;
      
  end  
end

