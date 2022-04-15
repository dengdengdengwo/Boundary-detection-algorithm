function [Zx,Zy] = HDT(Tz,ax,ay)
%HD 水平导数近似计算
  
[m,n] = size(Tz);
Zx = zeros(m,n);
Zy = zeros(m,n);
  for i = 1:1:m  %计算偏x导
      for j = 2:1:n-1
          Zx(i,j) = (Tz(i,j+1) -Tz(i,j-1))/(2*ax);
      end
  end
  
  for j = 1:1:n  %计算偏x导
      for i = 2:1:m-1
          Zy(i,j) = (Tz(i+1,j) -Tz(i-1,j))/(2*ay);
      end
  end
end

