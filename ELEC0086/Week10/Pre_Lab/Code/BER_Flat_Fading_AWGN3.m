function BER_Flat_Fading_AWGN3(N,Nch,mType,SNR_MAX_dB)

% N is the number of samples
% Nch is the number of channels
% mType indicates what type of modulation
% case 2: BPSK
% case 4: QPSK
% case 16: 16QAM
% case 64: 64QAM
% SNR_Max_dB indicates the largest signal niose ratio in dB
clc

M = log2(mType);
SNR_S = 1:SNR_MAX_dB;
SER_S = ones(1,length(SNR_S));

parfor SNR = 1:SNR_MAX_dB
   
    % generate a sequence of N QPSK symbols with normalised energy (x)
    u = randi([0 mType-1],1,N);
    x = qammod(u,mType,'UnitAveragePower',true);

    % generate a sequence of N Gaussian noise samples (mean 0, variance s2) (n)
    sigma = 10.^(SNR/(-20)); %standard deviation
    n = sigma.*(randn(Nch,1)+1i*randn(Nch,1))./sqrt(2);
    
    % generates the Rayleigh flat fading channel coefficients (h)
    h = (randn(Nch,1)+1i*randn(Nch,1))./sqrt(2);

    % generate a sequence of noisy received signal samples (y = x + n)
    %     y = awgn(x,SNR);

    y = h*x + n;

    % count the number of detection errors and evaluate the BER of the system
    ry = y./h;
    yd = qamdemod(ry,mType,'UnitAveragePower',true);

    [~, SER] = symerr(u,yd); 
    SER_S(SNR) = mean(SER);
end
% BER simulations for SNR from 0 to 20 dB
semilogy(SNR_S,SER_S/M);
grid on
title('Symbol error rate for %d over AWGN',mType);
xlabel('SNR');
ylabel('BER');

