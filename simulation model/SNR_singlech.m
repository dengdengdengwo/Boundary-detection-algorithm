function snr = SNR_singlech(I,In)
% ����һά�źŵ�����Ⱥ���
% I :�������ź�original signal
% In:�����ź�noisy signal(ie. original signal + noise signal)
Ps=sum((I-mean(mean(I))).^2); %signal powerI-mean(mean(I))).^2)
Pn=sum((I-In).^2); %noise power
snr=10*log10(Ps/Pn);
end

