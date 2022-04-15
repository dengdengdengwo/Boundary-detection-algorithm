function [g2,M,N,cl1,cl2,rl1,rl2] = largeMat(T)
%LARGEMATRIX  余弦扩边
%   T 待扩边数组
%   n 列
%   m 行
  [m,n] = size(T);
  [M,N,cl1,cl2,rl1,rl2] = largeMN(m,n);%扩边到2的幂行列
  
  g1 = zeros(m,N);
  g2 = zeros(M,N);
  T1 = T;
  
  for i = 1:1:m
      for j = 1:1:cl1
          g1(i,j) = T1(i,1) * cos((pi*(cl1+1-j))/(2*cl1));
      end
      for j = 1:1:cl2
          g1(i,n+cl1+j) = T1(i,n) * cos((pi*j)/(2*cl2));
      end
  end
  g1(:,cl1+1:cl1+n) = T1;
  
  for j = 1:1:N
      for i = 1:1:rl1
          g2(i,j) = g1(1,j) * cos((pi*(rl1+1-i))/(2*rl1));
      end
      for i = 1:1:rl2
          g2(rl1+m+i,j) = g1(m,j)*cos((pi*i)/(2*rl2));
      end
  end
  g2(rl1+1:rl1+m,:) = g1;
  
end
          

