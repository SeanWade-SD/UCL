function BER_AWGN1(N,mType,SNR_Max_dB)

%
% BER_AWGN(N,mType,SNR_dB)
%
% N is the number of samples
% mType indicates what type of modulation
% case 2: BPSK
% case 4: QPSK
% case 16: 16QAM
% case 64: 64QAM
% SNR_Max_dB indicates the largest signal niose ratio in dB

M = log2(mType); %number of bits per symbol
SNR_dB = 1:SNR_Max_dB; %generate SNR from 0 to maximum SNR
sigma = 10.^(-SNR_dB/20); %calculate sigma from signal noise ratio
L = length(SNR_dB); %range of SNR
SER = ones(1,L); %symbol error rate
% BER = ones(1,L);

for m = 1:L
    
    [s, c] = Symbol_Modulation1(N, mType);
    
    n = sigma(m)*(randn(1,N)+1i*randn(1,N))/sqrt(2); %generate white guassian noise
    
    r = s + n;
    
%     sDetect = ones(1,N);
   
%     r1 = repmat(r,mType,1);
    r2 = abs(r - c.');
    [~, index] = min(r2,[],1);
    sDetect = c(index);
    
    
    
%     for n = 1:N
%         [~, index] = min(abs(r(n) - c).^2);
%         sDetect(n) = c(index);
%     end
    
    [~, ser] = symerr(sDetect,s);
    SER(m) = ser;
    
    
%     for n = 1:N
%         [~, index] = min(abs(r(n) - c).^2);
%         sDetect(n) = c(index);
%         if sDetect(n) ~= s(n)
%             numErr = numErr + 1;
%         end
%     end
%     SER(m) = numErr/N;
    
end

BER = SER/M; %approximate SER = M*BER

semilogy(SNR_dB, BER);
grid on;
xlabel('SNR in dB');
ylabel('BER');

end

