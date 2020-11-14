clear all
clc

SNR_MAX = 20; %signal-to-noise ratio (SNR)

N = 1e6;
SNR_S = [];
BER_S = [];

for SNR = 0:1:SNR_MAX
   
    % generate a sequence of N 16 QAM symbols with normalised energy (x)
    u = randi([0 15],N,1);
    x = qammod(u,16);

    % generate a sequence of N Gaussian noise samples (mean 0, variance s2) (n)
    sigma = 10.^(SNR/(-20)); %standard deviation
    n = sigma.*(randn(N,1)+1i*randn(N,1))./sqrt(2);

    % generate a sequence of noisy received signal samples (y = x + n)
    %     y = awgn(x,SNR);
    %     scatterplot(y)
    y = x + n;
    %     scatterplot(y1)
    %     title('y1')

    % count the number of detection errors and evaluate the BER of the system
    yd = qamdemod(y,16);

    [numErrs, BER] = symerr(u,yd); 
    SNR_S = [SNR_S SNR];
    BER_S = [BER_S BER];
end
% BER simulations for SNR from 0 to 20 dB
semilogy(SNR_S,BER_S);
grid on
title('Symbol error rate for 16 QAM over AWGN');
xlabel('SNR');
ylabel('BER');


