function  [X,Y,Z] = gridData(x,y,z,num)
%DRAWPICTURE ����αɫ��ͼ
%   �˴���ʾ��ϸ˵��
  
    [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x),num)',linspace(min(y),max(y),num),'v4');%griddata���������������񻯴���

end

