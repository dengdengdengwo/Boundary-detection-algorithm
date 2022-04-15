function  T_drawPicture(x,y,z)
%DRAWPICTURE 绘制伪色彩图
%   此处显示详细说明
  
    figure
    [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%插值
    pcolor(X,Y,Z);
    shading interp %伪彩色图
    colormap(jet);
    colorbar;
    xticks(-80:20:80);
    yticks(-80:20:80);
    xlabel('x/m','fontsize',15);
    ylabel('y/m','fontsize',15);
    ylabel(colorbar,'磁场强度/nT','fontsize',13);
    
%     专利
%     rectangle('Position',[0,12,30,15],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%     rectangle('Position',[-30,-30,8,60],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%     rectangle('Position',[0,-30,30,30],'Curvature',[1,1],'LineWidth',2,'LineStyle','--','EdgeColor','k'),axis equal

%     单个物体
%     rectangle('Position',[-20,-10,40,20],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');

        %单目标
         rectangle('Position',[-20,-35,40,70],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
         
         %课题三目标
%        rectangle('Position',[-65,-15,20,30],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%        rectangle('Position',[-10,-15,20,30],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%        rectangle('Position',[45,-15,20,30],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');

end

