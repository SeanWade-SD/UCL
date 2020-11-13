
function BER_SNR_BPSK(total_bits, PindB)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the bit error rate over signal noise ratio
% Consider raleigh fading channel and Additive white noise
% Author        : Yiwei Xue
% Date          : 1 November 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all


P_dB = 1:PindB;
P = 10.^(P_dB/10);
y = zeros(length(P),1);

for i = 1:length(P)
    y(i) = BER_of_BPSK(total_bits, P(i));
end

semilogy(P_dB,y);
axis([0 35 10^-5 0.5])
grid on

end