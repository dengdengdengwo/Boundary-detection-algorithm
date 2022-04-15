function  T_drawPicture(x,y,z)
%DRAWPICTURE ����αɫ��ͼ
%   �˴���ʾ��ϸ˵��
  
    figure
    [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%��ֵ
    pcolor(X,Y,Z);
    shading interp %α��ɫͼ
    colormap(jet);
    colorbar;
    xticks(-80:20:80);
    yticks(-80:20:80);
    xlabel('x/m','fontsize',15);
    ylabel('y/m','fontsize',15);
    ylabel(colorbar,'�ų�ǿ��/nT','fontsize',13);
    
%     ר��
%     rectangle('Position',[0,12,30,15],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%     rectangle('Position',[-30,-30,8,60],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%     rectangle('Position',[0,-30,30,30],'Curvature',[1,1],'LineWidth',2,'LineStyle','--','EdgeColor','k'),axis equal

%     ��������
%     rectangle('Position',[-20,-10,40,20],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');

        %��Ŀ��
         rectangle('Position',[-20,-35,40,70],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
         
         %������Ŀ��
%        rectangle('Position',[-65,-15,20,30],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%        rectangle('Position',[-10,-15,20,30],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%        rectangle('Position',[45,-15,20,30],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');

end

