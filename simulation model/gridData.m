function  [X,Y,Z] = gridData(x,y,z,num)
%DRAWPICTURE 绘制伪色彩图
%   此处显示详细说明
  
    [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x),num)',linspace(min(y),max(y),num),'v4');%griddata的作用是数据网格化处理

end

