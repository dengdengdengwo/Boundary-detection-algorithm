function [] = pictDrawN(data,name)
%PICTDRAW 数据网格化
%   此处显示详细说明
    figure;
    data1 = data(45:435,45:435);
    pcolor(data1);
    title(name);
    xlabel('x(m)','fontsize',12);
    ylabel('y(m)','fontsize',12);
%     rectangle('Position',[174,158,40,70],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%     rectangle('Position',[74,158,40,70],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%     rectangle('Position',[274,158,40,70],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');

    axis tight
    shading interp %伪彩色图  
    colormap(jet);
    colorbar;

end

