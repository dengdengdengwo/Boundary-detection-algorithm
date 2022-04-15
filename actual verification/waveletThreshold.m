function [xd] = waveletThreshold(Y,wname,lev)
%WAVELETTHRESHOLD 函数ddencmp用于获取信号在消噪或压缩过程中的默认阈值，进行小波阈值去噪
% 阈值确定参考：https://blog.csdn.net/weixin_43118131/article/details/89945747
% Y带去噪信号；  wname是所用的小波函数;  lev分解层数;

%  函数ddencmp用于获取信号在消噪或压缩过程中的默认阈值。
   [thr,sorh,keepapp] = ddencmp('den','wv',Y);%将 in1 设置为 'den' 进行降噪或设置为 'cmp' 进行压缩 / 将 in2 设置为 'wv' 以使用小波或设置为 'wp' 以使用小波包。 

%  函数wdencmp用于一维或二维信号的消噪或压缩
   xd = wdencmp('gbl',Y,wname,lev,thr,sorh,keepapp);%gbl表示每层都采用同一个阈值进行处理

end

