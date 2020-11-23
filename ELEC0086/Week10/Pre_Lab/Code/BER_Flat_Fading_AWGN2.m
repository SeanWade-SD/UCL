function BER_Flat_Fading_AWGN2(N,Nch,mType,SNR_Max_dB)

%
% BER_AWGN(N,mType,SNR_dB)
%
% N is the number of samples
% Nch is the number of channels
% mType indicates what type of modulation
% case 2: BPSK
% case 4: QPSK
% case 16: 16QAM
% case 64: 64QAM
% SNR_Max_dB indicates the largest signal niose ratio in dB
clc

M = log2(mType); %number of bits per symbol
SNR_dB = 1:SNR_Max_dB; %generate SNR from 0 to maximum SNR
sigma = 10.^(-SNR_dB/20); %calculate sigma from signal noise ratio
L = length(SNR_dB); %range of SNR
% SER = ones(L,Nch); %symbol error rate
averSER = ones(L,1);
% BER = ones(1,L);

parfor m = 1:L
    
    [s, c] = Symbol_Modulation1(N, mType);
    
    n = sigma(m)*(randn(Nch,1)+1i*randn(Nch,1))/sqrt(2); %generate white guassian noise
    h = (randn(Nch,1)+1i*randn(Nch,1))/sqrt(2); 
    
    rc = h*s + n; %ralyfading channel
    
    rd = rc./h; %demodulate
    
    r = reshape(rd.',1,N*Nch);
    
%     r1 = repmat(r,mType,1);
    r2 = abs(r - c.');
    [~, index] = min(r2,[],1);
    sDetect = c(index);
    sRep = repmat(s,1,Nch);
    [~, ser] = symerr(sDetect,sRep);
    
    
    
%     for mch = 1:Nch
%         
%         r1 = repmat(r,mType,1);
%         r2 = abs(r1/h - c.');
%         [~, index] = min(r2,[],1);
%         sDetect = c(index);
%         [~, ser] = symerr(sDetect,s);
%         
%         
%         
%         
% %         sDetect = ones(1,N);
% %         for n = 1:N
% %             [~, index] = min(abs(r(n)/h - c).^2);
% %             sDetect(n) = c(index);
% %             if sDetect(n) ~= s(n)
% %                 numErr = numErr + 1;
% %             end
% %         end
%         SER(m,mch) = ser;
%     end
    averSER(m) = ser;
end

BER = averSER/M; %approximate SER = M*BER

semilogy(SNR_dB, BER);
grid on;
xlabel('SNR in dB');
ylabel('BER');

end

    
    
    
    
    
  