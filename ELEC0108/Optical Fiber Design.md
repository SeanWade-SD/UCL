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

$$
R = 10\cdot log_{10}(k\cdot T\cdot B_e) + NF+SNR
$$

- S: receiver sensitivity, in ***dBm***. A smaller value indicates better performance of the receiver. A larger value indicates lower performance of the receiver.

- k: Boltzmann constant, in J/K.

- T: absolute temperature, in K. As the temperature increases, receiver sensitivity becomes larger, degrading receiver performance. Therefore, lower the ambient temperature as much as possible.

- $$
  B_e =  Electrical\quad Bandwidth
  $$

  ***signal bandwidth(in Hz)***. or ***bit rate(in bits per second)***. Higher signal bandwidth represents a larger NF, higher receiver sensitivity, and therefore lower receiver performance.

- $$
  k\cdot T\cdot B\quad thermal noise power within the bandwidth range, in Watts.
  $$

- NF: noise factor, in dB.

- SNR: signal-to-noise ratio required for decoding signals, in dB. A small value of the minimum SNR can enhance receiver performance. The minimum SNR is related to the STA moving speed, wireless environment, and required communication quality. Minimum SNR requirements are different for wireless standards and services of the same wireless standard.



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
the\quad unit\quad of\quad\Delta f\quad  is\quad bit/s\quad or\quad Hz
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
\Delta\tau\approx3\cdot T
$$

$$
Symbol\quad duration:\quad T=1/B\quad (B\quad is\quad bit\quad rate)
$$

A perfect, zero linewidth, source when modulated at bit rate B has spectral width ~ 2B – corresponding to 100% raised cosine filtering.

Note: there are two line widths, one is source linewidth (unit is Hz) and another is linewidth for transmission (unit is nm)





