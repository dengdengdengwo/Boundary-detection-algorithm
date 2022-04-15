function y = pinknoise(m, n)
% 函数：y = pinknoise（m，n）
% m-矩阵行数
% n-矩阵列数
% y-具有粉红色（闪烁）噪声样本的矩阵
% mu = 0且sigma = 1时的百分比（列式）
% 该函数生成一个粉红色（闪烁）噪声样本矩阵（逐行）。 在恒定带宽下的功率方面，粉红色
% 噪声百分比以3 dB / oct（即10 dB / dec）下降。
% 定义噪声向量的长度并确保
% M为偶数，这将简化处理
m = round(m); n = round(n); N = m*n;
if rem(N, 2)
    M = N+1;
else
    M = N;
end
% generate white noise sequence
x = randn(1, M);
% FFT
X = fft(x);
% prepare a vector with frequency indexes 
NumUniquePts = M/2 + 1;     % number of the unique fft points
k = 1:NumUniquePts;         % vector with frequency indexes 
% 操作频谱的左半部分，因此PSD
% 与频率成正比，为1 / f，
% 即振幅与1 / sqrt（f）成正比
X = X(1:NumUniquePts);      
X = X./sqrt(k);
% prepare the right half of the spectrum - a conjugate copy of the left
% one except the DC component and the Nyquist component - they are unique,
% and reconstruct the whole spectrum
X = [X conj(X(end-1:-1:2))];
% IFFT
y = real(ifft(X));
% ensure that the length of y is N
y = y(1, 1:N);
% form the noise matrix and ensure unity standard 
% deviation and zero mean value (columnwise)
y = reshape(y, [m, n]);
y = bsxfun(@minus, y, mean(y));
y = bsxfun(@rdivide, y, std(y));
end
