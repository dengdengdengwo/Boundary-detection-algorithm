function vzz_temp = VDT(Tz,ax,ay)
%VDT 垂向导数近似计算

% 扩边
% [n,m] = size(Tz); 
[temp4,n2,m2,cl1,cl2,rl1,rl2] = largeMat(Tz); %n行 m列

% 快速傅里叶变换
  glfs = fftshift(fft2(temp4));
  
% 垂向导数频域转换因子
du = 1 / (m2*ax);dv= 1 / (n2*ay);
vfs = zeros(n2,m2);
for i  = 1:1:n2
    for j = 1:1:m2
        if i ~=(n2/2+1) || j ~= (m2/2+1)
            qv = (2*pi*(((j - (m2/2+1))*du)^2 + ((i - (n2/2+1))*dv)^2)^0.5)^(-1);
            vfs(i,j) = glfs(i,j)*qv;
            vfs((n2/2+1),(m2/2+1)) = vfs((n2/2+1),(m2/2+1)) - vfs(i,j);
        end
    end
end
      
  % 反傅里叶变换
 vl = real(ifft2(fftshift(vfs)));
 vlxx = zeros(n2,m2);
 vlyy = zeros(n2,m2);
 vlzz = zeros(n2,m2);
 for i = 3:1:n2-3
     for j = 3:1:m2-2
         vlxx(i,j) = 2*(vl(i,j+2)+vl(i,j-2)-vl(i,j)) / (7*ax^2)-(vl(i,j+1)+vl(i,j-1))/(7*ax^2);
         vlyy(i,j) = 2*(vl(i+2,j)+vl(i-2,j)-vl(i,j)) / (7*ay^2)-(vl(i+1,j)+vl(i-1,j))/(7*ay^2);
         vlzz(i,j) = (vlxx(i,j)+vlyy(i,j));
     end
 end
  
%  缩编
% vzz_temp = zeros(n,m);
vzz_temp = -vlzz(cl1+1:n2-cl2,rl1+1:m2-rl2);
% vzz_temp2 = flipud(vzz_temp);%上下翻转

% figure;
% % imagesc(vzz_temp2);
% % colormap(jet);
% % colorbar;
% pcolor(vzz_temp);
% shading interp %伪彩色图
% title("垂向导数");
% colormap(jet);
% colorbar;

end

