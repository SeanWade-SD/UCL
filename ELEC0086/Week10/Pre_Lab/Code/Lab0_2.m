clear all
clc

N = 1e6; %Samples
SNR = 20; %Signal-noise-ratio for 16-QAM

% generate a random sequence of N BPSK symbols {±1}
u1 = randi([0 1],N,1);
s1 = qammod(u1,2);
scatterplot(s1);
title('BPSK');

% generate a random sequence of N QPSK symbols {±1±j}
u2 = randi([0 3],N,1);
s2 = sqrt(2).*pskmod(u2,4,pi/4);
scatterplot(s2);
title('QPSK');

% generate a random sequence of N 16-QAM symbols {(±1 or ±3) + (±j or ±3j)}
u3 = randi([0 15],N,1);
s3 = qammod(u3,16);

% Generate a large number of complex zero-mean Gaussian random variables with variance of σ 2
s4 = (randn(N,1)+1i*randn(N,1));
histogram(abs(s4),100);
title('PDF of Gaussian Distribution');
figure(3);
histogram(angle(s4),100);
title('Phase of Gaussian Dsitribution');
hold on

% 16-QAM symbols and complex Gaussian noise
s5 = awgn(s3,SNR,'measured');
scatfig= scatterplot(s5);
hold on 
scatterplot(s3,1,1e5,'r*',scatfig);
title('16 QAM with AWGN');










