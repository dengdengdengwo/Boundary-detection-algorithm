function [xd] = waveletThreshold(Y,wname,lev)
%WAVELETTHRESHOLD ����ddencmp���ڻ�ȡ�ź��������ѹ�������е�Ĭ����ֵ������С����ֵȥ��
% ��ֵȷ���ο���https://blog.csdn.net/weixin_43118131/article/details/89945747
% Y��ȥ���źţ�  wname�����õ�С������;  lev�ֽ����;

%  ����ddencmp���ڻ�ȡ�ź��������ѹ�������е�Ĭ����ֵ��
   [thr,sorh,keepapp] = ddencmp('den','wv',Y);%�� in1 ����Ϊ 'den' ���н��������Ϊ 'cmp' ����ѹ�� / �� in2 ����Ϊ 'wv' ��ʹ��С��������Ϊ 'wp' ��ʹ��С������ 

%  ����wdencmp����һά���ά�źŵ������ѹ��
   xd = wdencmp('gbl',Y,wname,lev,thr,sorh,keepapp);%gbl��ʾÿ�㶼����ͬһ����ֵ���д���

end

