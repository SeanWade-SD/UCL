clear all
clc

SNR_MAX = 20; %signal-to-noise ratio (SNR)
M = log2(64);

N = 1e5; %number of samples
L = 1e3; %number of channels
SNR_S = 1:SNR_MAX;
SER_S = ones(1,length(SNR_S));

for SNR = 1:1:SNR_MAX
   
    % generate a sequence of N QPSK symbols with normalised energy (x)
    u = randi([0 63],1,N);
    x = qammod(u,64,'UnitAveragePower',true);
    

    % generate a sequence of N Gaussian noise samples (mean 0, variance s2) (n)
    sigma = 10.^(SNR/(-20)); %standard deviation
    n = sigma.*(randn(L,1)+1i*randn(L,1))./sqrt(2);
    
    % generates the Rayleigh flat fading channel coefficients (h)
    h = (randn(L,1)+1i*randn(L,1))./sqrt(2);

    % generate a sequence of noisy received signal samples (y = x + n)
    %     y = awgn(x,SNR);

    y = h*x + n;

    % count the number of detection errors and evaluate the BER of the system
    ry = y./h;
    yd = qamdemod(ry,64,'UnitAveragePower',true);

    [numErrs, SER] = symerr(u,yd); 
    SER_S(SNR) = mean(SER);
end
% BER simulations for SNR from 0 to 20 dB
semilogy(SNR_S,SER_S/M);
grid on
title('Symbol error rate for QPSK over AWGN');
xlabel('SNR');
ylabel('BER');

