function y = pinknoise(m, n)
% ������y = pinknoise��m��n��
% m-��������
% n-��������
% y-���зۺ�ɫ����˸�����������ľ���
% mu = 0��sigma = 1ʱ�İٷֱȣ���ʽ��
% �ú�������һ���ۺ�ɫ����˸�����������������У��� �ں㶨�����µĹ��ʷ��棬�ۺ�ɫ
% �����ٷֱ���3 dB / oct����10 dB / dec���½���
% �������������ĳ��Ȳ�ȷ��
% MΪż�����⽫�򻯴���
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
% ����Ƶ�׵���벿�֣����PSD
% ��Ƶ�ʳ����ȣ�Ϊ1 / f��
% �������1 / sqrt��f��������
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
