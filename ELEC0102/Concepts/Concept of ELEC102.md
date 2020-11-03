# Concepts of Mobile Communication Systems



### SNR & SINR

#### SNR:

The core-concept so to speak for SNR (signal-to-noise ratio) is simply a measure of how much signal you have relative to your noise -- that's all. For example, on an Internet forum with very little moderation where bad posts are allowed to stick around, you may have a lot of 'noisy' posts crowding out the posts full of useful information.
$$
SNR = P_signal / P_noise
$$
Similarly, if you have a signal you're sending over some communication channel, and then you apply AWGN (additive white Gaussian noise) to it, if you apply too much noise to that signal, it may be impossible to recover it. Additional "noise" sources could be Doppler shift, fading effects, path loss, etc.

A related concept to SNR is Eb/No, or energy per bit to noise-power spectral density ratio. Grossly simplified, one could consider this as how much energy you are shoving into each bit. This will come into play below talking about **modulation**.

Speaking of bits, let's talk **modulation** schemes. There's a litany of acronyms -- FSK, MSK, OOK, PSK, QAM, BSK, etc. Simply put, these are all ways of talking a signal / data (i.e. 1010 1010), modulating some carrier wave in some fashion, and then transmitting that modulated signal over your **channel**. After the channel, the receiver must **demodulate** this signal. A modulator well generate **symbols** for transmission.

One measure of performance is BER, or bit-error rate. Simply put, this is measuring how many of your bits made it correctly over your channel. Certain modulation schemes can deliver excellent BER performance compared to others; for example, if we just look at QAM, which FakeMoustache posted, you'll see that the signal energy is spread out over the constellation, and symbols at the far ends will have less Es (energy per symbol) than the ones closer to the middle. That scheme can push a lot of data, but compared to something simple like QPSK, where it's simply four equidistant points, it may be less tolerant to errors due to channel.

A quick example is QAM -- quadrature amplitude moduation. This is a coherent modulation schemes (must have phase knowledge) that is commonly used in both wireless and wired communication. Your average HDTV / cable systems utilize 256-QAM; some powerline networking products in your home utilize 1024 or even 4096 QAM. It all is dependent on what channel you're going to send it over; relatively low-noise, reliable copper-wiring, or a noisy, lossy free-space channel from the top of a mountain to a nearby city.

Here's a very high-level overview of the probability of bit and symbol errors for common modulations:[![enter image description here](https://i.stack.imgur.com/MgJdz.png)](https://i.stack.imgur.com/MgJdz.png)

One could also perform Monte Carlo simulations to attain experimental results, but these close-formed expressions utilizing Q Functions can be leveraged to generate some quick simulated graphs to compare performance.

As with all of engineering, modulation schemes are an exercise in **compromise**. Some may deliver an excellent BER at the expensive of requiring a powerful, highly complex receiver device. Others may be really good at data throughput, but awful resistance to interference. An engineer could try to fight noise problems by increasing transmit power, but that comes at the cost of money, power and size. He could try to use a more advanced scheme at the expense of a complex receiver that requires CSI (Channel State information).

So presented with a problem where 'interference' and/or a poor SNR is a problem, here are some things we can do with a non-exhaustive list of cons:

1. Add transmitter power (cons: power, size, weight, cost)
2. Add receiver "strength" (i.e. bigger, better antenna) (cons: size, cost, etc.)
3. Change modulation schemes to something with a better BER (cons: loss of bandwidth/throughput, increase Rx complexity possibly)
4. Increase system 'smarts' w/ cognitive radio-like behavior, pilot signals, etc.
5. Add diversity (i.e. -- add more antennas!)
6. Many, many more...



#### SINR:

Analogous to the SNR used often in wired communications systems, the SINR is defined as the power of a certain signal of interest divided by the sum of the interference power (from all the other interfering signals) and the power of some background noise. If the power of noise term is zero, then the SINR reduces to the signal-to-interference ratio (SIR)



### DSSS and FHSS

#### DSSS: Direct squence spread spectrum

Direct sequence spread spectrum is a form of transmission that looks very similar to white noise over the bandwidth of the transmission. However once received and processed with the correct descrambling codes, it is possible to extract the required data. When transmitting a DSSS spread spectrum signal, the required data signal is multiplied with what is known as a spreading or chip code data stream. The resulting data stream has a higher data rate than the data itself. Often the data is multiplied using the XOR (exclusive OR) function. Each bit in the spreading sequence is called a chip, and this is much shorter than each information bit. The spreading sequence or chip sequence has the same data rate as the final output from the spreading multiplier. The rate is called the chip rate, and this is often measured in terms of a number of M chips / sec.

The first part of the process is to generate the DSSS signal. Take as an example that the data to be transmitted is 1001, and the chip or spreading code is 0010. For each data bit, the complete spreading code is used to multiple the data, and in this way, for each data bits, the spread or expanded signal consists of four bits.

| 1    | 0    | 0    | 1    | Data to be transmitted       |
| ---- | ---- | ---- | ---- | ---------------------------- |
| 0010 | 0010 | 0010 | 0010 | Chip or spreading code       |
| 1101 | 0010 | 0010 | 1101 | Resultant spread data output |

With the signal obtained and transmitted, it needs to be decoded within the remote receiver:

| 1101 | 0010 | 0010 | 1101 | Incoming CDMA signal   |
| ---- | ---- | ---- | ---- | ---------------------- |
| 0010 | 0010 | 0010 | 0010 | Chip or spreading code |
| 1111 | 0000 | 0000 | 1111 | Result of de-spreading |
| 1    | 0    | 0    | 1    | Integrated output      |

In summary, 

1) more bandwidth

2) encoded data

3) low power density and nosie-like signal



##### Psudonoise sequence code (PN code)

A **pseudo-noise code** (**PN code**) or **pseudo-random-noise code** (**PRN code**) is one that has a spectrum similar to a random sequence of bits but is deterministically generated. The most commonly used sequences in direct-sequence spread spectrum systems are [maximal length sequences](https://en.wikipedia.org/wiki/Maximal_length_sequence), [Gold codes](https://en.wikipedia.org/wiki/Gold_code), [Kasami codes](https://en.wikipedia.org/wiki/Kasami_code), and [Barker codes](https://en.wikipedia.org/wiki/Barker_code).



#### FHSS: Frequency hopping spread spectrum

**Frequency-hopping spread spectrum** (**FHSS**) is a method of transmitting radio signals by rapidly changing the carrier frequency among many distinct frequencies occupying a large spectral band. The changes are controlled by a code known to both transmitter and receiver. FHSS is used to avoid interference, to prevent eavesdropping, and to enable code-division multiple access(CDMA) communications. The available frequency band is divided into smaller sub-bands. Signals rapidly change ("hop") their carrier frequencies among the center frequencies of these sub-bands in a predetermined order. Interference at a specific frequency will only affect the signal during a short interval.

![Screen Shot 2020-10-26 at 5.25.04 PM](/Users/xueyiwei/Library/Application Support/typora-user-images/Screen Shot 2020-10-26 at 5.25.04 PM.png)



FHSS offers three main advantages over a fixed-frequency transmission:

1. FHSS signals are highly resistant to narrowband interferencebecause the signal hops to a different frequency band.
2. Signals are difficult to intercept if the frequency-hopping pattern is not known.
3. FHSS transmissions can share a frequency band with many types of conventional transmissions with minimal mutual interference. FHSS signals add minimal interference to narrowband communications, and vice versa.



### Fading

Fading is a phenomenon that occurs due to varying parameters and conditions of the channel during wireless propagation. To better understand and eliminate the adverse effects of fading, it is divided into various types. Let us take a look into them in detail.

![img](https://cdn.everythingrf.com/live/1591780703992_637273775035563946.jpeg)

The figure above shows the different types of fading and the sub-categories. We have tried to elaborate on each type of fading below and provide information on how do they affect wave propagation.

**1. Large Scale Fading:** This refers to the attenuation of signal power due to obstacles between the transmitter and receiver. It also covers the attenuation and fluctuations of signal when the signal is transmitted over a long distance (usually in kilometres).

- **Path Loss:** It refers to the attenuation when a signal is transmitted over large distances. Wireless signals spread as they propagate through the medium and as the distance increases, the energy per unit area starts decreasing ([Click here to try the Path Loss Calculator](https://www.everythingrf.com/rf-calculators/free-space-path-loss-calculator)).This is a fundamental loss that is independent of the type of transmitter and medium. Although, we can minimize its effects by increasing the capture area/dimension of the receiver. The figure below shows the [radiation pattern](https://en.wikipedia.org/wiki/Radiation_pattern) and spread of the signal transmitted from the antenna.

![img](https://cdn.everythingrf.com/live/1591780704035_637273775037944011.png)

- **Shadowing:** This refers to the loss in signal power due to the obstructions in the path of propagation. There are a few ways in which shadowing effects can minimize signal loss. One that is most effective, is to have a Line-Of-Sight propagation.

  Shadowing losses also depend on the frequency of the EM wave. As we know, EM Waves can penetrate through various surfaces but at the cost of loss in power i.e signal attenuation. The losses depend on the type of the surface and frequency of the signal. Generally, the penetration power of a signal is inversely proportional to the frequency of the signal.

**2. Small Scale Fading:** This refers to the fluctuations in signal strength and phase over short distance and small duration of time. It is also called Rayleigh Fading. Small Scale Fading affects almost all forms of wireless communication and overcoming them is a necessity to increase efficiency and decrease error.

- **Fast Fading:** It occurs mainly due to reflections for surfaces and movement of transmitter or receiver. High [doppler spread](https://electronics.stackexchange.com/questions/123427/what-is-doppler-spread) is observed in the fast fading with Doppler bandwidth comparable to or greater than the bandwidth of the signal and the channel variations are as fast or faster than the signal variations. It causes linear distortions in the shape of the baseband signal and creates [Inter Symbol Interference (ISI)](https://en.wikipedia.org/wiki/Intersymbol_interference). One way to remove ISI is [adaptive equalization](https://en.wikipedia.org/wiki/Adaptive_equalizer).

- **Slow Fading:** It occurs mainly due to shadowing where large buildings or geographical structures obstruct the LOS. Low doppler spread is observed in Slow Fading with the doppler bandwidth being smaller compared to the bandwidth of the signal and the channel variations are slow relative to the signal variations. It results in reduction of SNR which can be overcome using error correction techniques and receiver diversity techniques.

- Multipath Fading:

  It occurs when a signal reaches the receiver from various path i.e. when multipath propagation takes place. Multipath fading can affect all ranges of frequencies starting from low frequency to microwave and beyond. It affects both the amplitude and the phase of the signal causing phase distortions and ISI. Multipath fading can affect signal transmission in two ways:

  - **Flat Fading:** In flat fading, all frequency components get affected almost equally. Flat multipath fading causes the amplitude to fluctuate over a period of time.
  - **Selective Fading:** Selective Fading or Selective Frequency Fading refers to multipath fading when the selected frequency component of the signal is affected. It means selected frequencies will have increased error and attenuation as compared to other frequency components of the same signal. This can be overcome by techniques such as OFDM which spreads the data across the frequency components of the signal to reduce data loss.



### Equaiprobable signal

equi = equal  

prbable = probability 

e.g. For 0,1 signal, p[0] = p[1]



### Inter-carrier interference

Multicarrier transmission for wireline channels has been well studied. The main advantage of orthogonal frequency division multiplexing (OFDM1 ) transmission stems from the fact that the Fourier basis forms an eigenbasis for time-invariant (DMT) channels. This simplifies the receiver and leads to inexpensive hardware implementations, as the equalizer is just a single-tap filter in the frequency domain (under the assumptionthat the channel is time-invariant within a transmission block). Furthermore, combined with multiple antennas, OFDM modems are attractive for high data rate wireless networks (wireless LANs and home networking). However, ***the block time-invariance assumption may not be valid*** at high mobile speeds or when there are impairments such as synchronization errors (e.g., frequency offsets). In such situations, the Fourier basis need not be the eigenbasis, and the loss of orthogonality (of the carriers) at the receiver results in intercarrier interference (ICI). Depending on the Doppler spread in the channel and the block length chosen for transmission, ICI can potentially cause a severe deterioration of quality of service (QoS) in OFDM systems. Essentially, ICI arises from “time-selectivity” of the channel and, therefore, ***is the frequency-domain dual of the intersymbol interference*** (ISI) seen in single-carrier transmission over frequency-selective channels.



### Punctured code

In [coding theory](https://en.wikipedia.org/wiki/Coding_theory), **puncturing** is the process of removing some of the parity bits after encoding with an [error-correction code](https://en.wikipedia.org/wiki/Error_correction_and_detection). This has the same effect as encoding with an error-correction code with a higher rate, or less redundancy. However, with puncturing the same decoder can be used regardless of how many bits have been punctured, thus puncturing considerably increases the flexibility of the system without significantly increasing its complexity.

[![img](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Punct.png/600px-Punct.png)](https://en.wikipedia.org/wiki/File:Punct.png)

In some cases, a pre-defined pattern of puncturing is used in an encoder. Then, the inverse operation, known as depuncturing, is implemented by the decoder.

















































### Guard band

In radio, a **guard band** is an unused part of the radio spectrum between radio bands for the purpose of preventing interference. 						It is a narrow frequency range used to separate two wider frequency ranges to ensure that both can transmit simultaneously 						without interfering with each other

### Noise figure

https://en.wikipedia.org/wiki/Noise_figure#:~:text=The%20noise%20figure%20is%20the,0%20(usually%20290%20K).



### OFDM

http://rfmw.em.keysight.com/wireless/helpfiles/89600b/webhelp/subsystems/wlan-ofdm/content/ofdm_basicprinciplesoverview.htm



