# Optical Fiber Design

## Noise in Optical Fiber

###  Thermal Noise 

$$
\sigma^2_{V_{thermal}} = \frac{4\cdot k_B\cdot T\cdot B_e}{R}
$$

- R = Resistance (often 50W)

- Temperature T

- $$
  k_B= Boltzmann’s \quad Constant = 1.38\cdot10^{-23} J/{o_K}
  $$

- $$
  B_e = Electrical\quad Bandwidth
  $$

- ***Signal independent noise***



### Shot Noise 

$$
\sigma^2_{V_{shot}} = 2\cdot e\cdot I\cdot B_e
$$

- e = Charge on an electron = 1.6x10 -19 C

- $$
  B_e =  Electrical\quad Bandwidth
  $$

- $$
  I = R\cdot \frac{P_{rx}}{2} =Average\quad photocurrent\quad generated
  $$

- R = Responsivity

- $$
  P_{rx} =Power\quad at\quad the\quad Receiver
  $$

- ***Signal Dependent Noise***



### Using s and n' to express the noise

- Signal shot noise(***present only on data ones***)
  $$
  2\cdot s
  $$

- Spontaneous shot noise(***present on ones and zeros***)

$$
n'
$$

- Signal-spontaneous beat noise(***only on data ones***)

$$
\frac{2\cdot s\cdot n’}{D\cdot \Delta f}
$$

- Spontaneous-spontaneous beat noise(on both ones and zeros)

$$
\frac{n’\cdot 2}{2\cdot D\cdot \Delta f}
$$

​		s: mean number of signal photons per second

​		n': mean spontaneous noise in photons per second in a specific optical bandwidth 
$$
optical\quad bandwidth\quad\Delta f
$$

## Receiver Sensitivity

- The ***receiver sensitivity*** is defined as the <u>minimum average power</u> required at the receiver to <u>maintain a certain bit error rate</u> (BER). Often today required BERs are >$10^{-12}$ (one error per $10^{12}$ bits) although often in text books $10^{-9} $ is still used.

- Will be specified for a certain wavelength

- Is dependent on noise power therefore it also depends on the bandwidth, thus the bit rate.
  - The thermal noise can be expressed as: $\sigma_{thermal}=\sqrt{\frac{4\cdot k_B\cdot T\cdot\Delta f}{R}} $ 
  - The shot noise can be expressed as: $\sigma_{shot}=\sqrt{2\cdot q\cdot I\cdot\Delta f}$
  - $\Delta f$ is the same as $B_e$ representing bandwidth in Hz
  - $q$ is the same as $e$ representing electronic charge $1.6\cdot 10^{-19} C$ 

- Since the SNR is related to $10\cdot log_{10}(\frac{P_o}{\sigma})$ , where $P_o$ is the power of signal and $\sigma$ is the noise,

  the SNR is proportional with $\frac{1}{\sqrt{\Delta f}}$ , which means that the $P_o$ should be increased by $\sqrt{\alpha}$ when the bandwidth is up to  $\alpha\cdot\Delta f$ , to keep the bit rate stationary. Therefore, the receiver sensitivity in dB should be added by $10\cdot log_{10}(\sqrt{\alpha})$ if the transmit bit rate changes. 

  - ***In the receiver***, the ***bandwidth*** of the signal is set to be the same as ***bit rate $(B)$***
  - ***In the fiber***, the ***bandwidth*** of signal is set to be ***twice the bit rate $(2B)$***

  

## Relationship between Linewidth and Bandwidth

$$
c = f\cdot \lambda
$$

$$
f = \frac{c}{\lambda}
$$

$$
\frac{df}{d\lambda} = -\frac{c}{\lambda^2}
$$

$$
\Delta f = -\frac{c}{\lambda^2}\Delta\lambda
$$

$$
\Delta\lambda = -\frac{\lambda^2}{c}\Delta f
$$

$$
the\quad unit\quad of\quad   bandwidth\quad \Delta f\quad is\quad Hz
$$

$$
the\quad unit\quad of\quad\Delta\lambda\quad is\quad nm
$$



## Power Budget

- Fiber loss: X (dB/km)

- Splice loss: S (dB)

- Received power: 
  $$
  P_{rx}
  $$

- Transmitted power:
  $$
  P_t
  $$

- Receiver Sensitivity:
  $$
  P_r
  $$

- Operating margin: m (dB)
  $$
  m = P_{rx}-P_r
  $$

- 

- System span/distance: L (km)
  $$
  L = \frac{P_t-S-P_r-m}{X}
  $$
  

## Despersion Limit

$$
Dispersion:\quad D\quad (ps/nm\cdot km)
$$

$$
Fiber\quad span:\quad L\quad(km)
$$

$$
Source\quad linewidth:\quad\Delta\lambda\quad(Hz)
$$

$$
Pulse\quad spreading:\quad\Delta\tau=\Delta\lambda\cdot D\cdot L
$$

$$
1\quad dB\quad power\quad penalty:\quad\Delta\tau\approx0.3\cdot T
$$

$$
Symbol\quad duration:\quad T=1/B\quad (B\quad is\quad bit\quad rate)
$$

A perfect, zero linewidth, source when modulated at bit rate B has spectral width ~ 2B – corresponding to 100% raised cosine filtering. 







