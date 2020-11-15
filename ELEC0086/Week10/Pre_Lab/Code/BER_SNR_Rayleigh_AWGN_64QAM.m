clear all
clc

SNR_MAX = 20; %signal-to-noise ratio (SNR)

N = 1e6;
SNR_S = [];
BER_S = [];

for SNR = 0:1:SNR_MAX
   
    % generate a sequence of N QPSK symbols with normalised energy (x)
    u = randi([0 63],N,1);
    x = qammod(u,64);

    % generate a sequence of N Gaussian noise samples (mean 0, variance s2) (n)
    sigma = 10.^(SNR/(-20)); %standard deviation
    n = sigma.*(randn(N,1)+1i*randn(N,1))./sqrt(2);
    
    % generates the Rayleigh flat fading channel coefficients (h)
    h = (randn(N,1)+1i*randn(N,1))./sqrt(2);

    % generate a sequence of noisy received signal samples (y = x + n)
    %     y = awgn(x,SNR);

    y = h.*x + n;

    % count the number of detection errors and evaluate the BER of the system
    ry = y./h;
    yd = qamdemod(ry,64);

    [numErrs, BER] = symerr(u,yd); 
    SNR_S = [SNR_S SNR];
    BER_S = [BER_S BER];
end
% BER simulations for SNR from 0 to 20 dB
semilogy(SNR_S,BER_S);
grid on
title('Symbol error rate for QPSK over AWGN');
xlabel('SNR');
ylabel('BER');

