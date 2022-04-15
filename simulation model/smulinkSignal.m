function [noise,output] = smulinkSignal(signal,snr)
%����һ�����й̶�����ȵķۺ����������ź�
%   signal:�����ź�
%   snr: �����
%   m,n:�ź�������
% noise - smulinkSignal(signal,snr,num_data,noise)

    [m,n] = size(signal);
    sigPowerya = sum(abs(signal(:).^2))/length(signal(:));%�źŵľ���ֵ
    Ps = 10*log10(sigPowerya);
    Pn = Ps - snr;                   % noise power, dBV^2
    noiPowerya = 10.^(Pn/10);                 % noise power, V^2
    sigma = sqrt(noiPowerya);                % noise RMS, V
    noise = sigma*pinknoise(m, n);  % pink noise generation  ��������ķۺ챳������
    output = signal  + noise;
    
end
