function [] = pictDraw(data,name)
%PICTDRAW ��������
%   �˴���ʾ��ϸ˵��
    figure;
    pcolor(data);
    title(name);
    xlabel('x(m)','fontsize',12);
    ylabel('y(m)','fontsize',12);
%     rectangle('Position',[179,165,40,70],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%     rectangle('Position',[79,165,40,70],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
%     rectangle('Position',[279,165,40,70],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');

    axis tight
    shading interp %α��ɫͼ  
    colormap(jet);
    colorbar;

end

