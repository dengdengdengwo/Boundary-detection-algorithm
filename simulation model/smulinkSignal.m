function [noise,output] = smulinkSignal(signal,snr)
%生成一个含有固定信噪比的粉红噪声仿真信号
%   signal:输入信号
%   snr: 信噪比
%   m,n:信号行列数
% noise - smulinkSignal(signal,snr,num_data,noise)

    [m,n] = size(signal);
    sigPowerya = sum(abs(signal(:).^2))/length(signal(:));%信号的均方值
    Ps = 10*log10(sigPowerya);
    Pn = Ps - snr;                   % noise power, dBV^2
    noiPowerya = 10.^(Pn/10);                 % noise power, V^2
    sigma = sqrt(noiPowerya);                % noise RMS, V
    noise = sigma*pinknoise(m, n);  % pink noise generation  生成随机的粉红背景噪声
    output = signal  + noise;
    
end
