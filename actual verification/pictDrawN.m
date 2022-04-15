function [] = pictDrawN(data,name)
%PICTDRAW 数据网格化
%   此处显示详细说明
    figure;
    pcolor(data);
    
%     南海长度限制
    set(gcf,'position',[500,150,350,420]);
    
    title(name);
    xlabel('x','fontsize',12);
    ylabel('y','fontsize',12);
%     rectangle('Position',[179,165,40,70],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
    axis tight
    shading interp %伪彩色图  
    colormap(jet);
    colorbar;
end

