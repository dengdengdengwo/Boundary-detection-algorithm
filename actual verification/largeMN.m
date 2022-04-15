function [M,N,cl1,cl2,rl1,rl2] = largeMN(m,n)
%LARGEMN �������2�����������
%   �˴���ʾ��ϸ˵��
    mt = floor(log2(m))+1;
    nt = floor(log2(n))+1;
    M = 2^mt;
    N = 2^nt; 
    cl1 = floor((M-m)/2);
    cl2 = M-m-cl1;
    rl1 = floor((N-n)/2);
    rl2 = N-n-rl1;
end

