function [] = nanhai_pictDraw(data,name)
%PICTDRAW ��������
%   �˴���ʾ��ϸ˵��
    figure;
    pcolor(data);
    set(gcf,'position',[500,150,330,420]);
    title(name);
    xlabel('x','fontsize',12);
    ylabel('y','fontsize',12);
%     rectangle('Position',[179,165,40,70],'Curvature',[0,0],'LineWidth',2,'LineStyle','--','EdgeColor','k');
    axis tight
    shading interp %α��ɫͼ  
    colormap(jet);
    colorbar;
end

