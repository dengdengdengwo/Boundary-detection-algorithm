function snr = SNR_singlech(I,In)
% 计算一维信号的信噪比函数
% I :无噪声信号original signal
% In:含噪信号noisy signal(ie. original signal + noise signal)
Ps=sum((I-mean(mean(I))).^2); %signal powerI-mean(mean(I))).^2)
Pn=sum((I-In).^2); %noise power
snr=10*log10(Ps/Pn);
end

