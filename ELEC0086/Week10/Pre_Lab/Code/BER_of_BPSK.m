function [BER] = BER_of_BPSK(total_bits, P)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the bit error rate over signal noise ratio
% Consider raleigh fading channel and Additive white noise
% Author        : Yiwei Xue
% Date          : 1 November 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all


u=rand(total_bits,1);
s(1:total_bits,1)=1;
s(u<0.5)=-1; 

h=(randn(total_bits,1)+1i*randn(total_bits,1))/sqrt(2);
n=(randn(total_bits,1)+1i*randn(total_bits,1))/sqrt(2);

s_est=real((sqrt(P)*h.*s+n)./(sqrt(P).*h));
stilde(s_est>0)=1; 
stilde(s_est<=0)=-1;
BER = length(find(transpose(stilde)~=s))/total_bits;

end

