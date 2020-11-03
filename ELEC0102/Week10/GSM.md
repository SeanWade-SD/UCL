### GSM -- Cellular Network

- use of several carrier frequencies

- not the same frequency in adjoining cells

- cell sizes vary from some 100 m up to 35 km depending on user density, geography, transceiver power etc.

- hexagonal shape of cells is idealized (cells overlap, shapes depend on geography)

- if a mobile user changes cells handover of the connection to the neighbor cell



### GSM Mobile Service Domains



<img src="/Users/xueyiwei/Library/Application Support/typora-user-images/Screen Shot 2020-11-01 at 10.39.01 PM.png" alt="Screen Shot 2020-11-01 at 10.39.01 PM" style="zoom:50%;" />



#### Bear (data) Services

-- Transfer user data and control signals between two pieces of equipment.

- Essentially data services specified up to the terminal interface

- Different data  rates for voice and data (original standard)

  - data service (circuit switched )
    - synchronous: 2.4, 4.8 or 9.6 kbit/s
    - asynchronous: 300 - 1200 bit/s
  - data services (packet switched)
    - synchronous: 2.4, 4.8 or 9.6 kbit/s
    - asynchronous: 300 - 9600 bit/s

- GSM data has now been largely superseded by GPRS

  

#### Telematic (telephony) Services

-- Provide communication between users according to agreed protocols

##### Tele service 1

- Voice communication via mobile phones

- obey cellular functions and security measurements

- Voice services

  - Mobile telephony

    offering tranditional bandwidth of 3.1 kHz

  - Emergency number

    Europe, madatory, free of charge, highest priority

  - Multinumbering

    Serveral ISDN phone numbers per user possible

##### Tele service 2

- Non-voice tele services :
  - Short Message Service (SMS): 160 characters per message
  - Cell broadcast: To broadcast messages in a specific area
  - Fax mail
  - Group 3 fax fascimile: Communication with analogue fax
  - Voice mailbox
  - Bual Tone Multi Frequency (DMTF): For remote control



#### Supplementary Services

-- Services proivded on top of tele services or bearer services

- Supplementary services are offered as an add-on to basci services
- They cannot be offered stand-alone
- Similar to ISDN services but lower bandwidth due to the radio link
- May differ between service providers, countries and protocols
- Including:
  - Caller identification
  - Suppression of number forwarding 
  - Automatic call-back
  - Call hold
  - Call barring 
  - Multiparty service
  - Advice of charge



### GSM Subsystems

- GSM is a type of Public Land Mobile Network (PLMN)
- GSM network can be divided into 3 subsystems:
  - RSS (radio subsystem)
  - NSS (network and switching subsystem)
  - OSS (operation and support subsystem)

- GSM networks are connected via terrestrial networks:
  - PSTN: Public Switched Telephone Network
  - ISDN: Integrated Services Digital Network
  - PDN: Pblic Data Network
    - Circuit-switched PDN (CSPDN)
    - Packet-switched PDN (PSPDN)



### GSM Network Architecture 



<img src="/Users/xueyiwei/Library/Application Support/typora-user-images/Screen Shot 2020-11-01 at 10.44.12 PM.png" alt="Screen Shot 2020-11-01 at 10.44.12 PM" style="zoom:50%;" />



#### GSM Components, Interfaces, Databases

<img src="/Users/xueyiwei/Library/Application Support/typora-user-images/Screen Shot 2020-11-01 at 10.47.06 PM.png" alt="Screen Shot 2020-11-01 at 10.47.06 PM" style="zoom: 50%;" />

###### Components

- MS= Mobile Station 

- BTS=Base Transceiver Station 

- BSC=Base Station Controller 

- MSC=Mobile Switching Centre 

- GMSC=Gateway MSC 

- OMC=Operation & Maintenance Centre



###### Interfaces

- A interface : links MSC and BSC 

- Abis interface : links BSC and BTS 

- Um interface : radio link between BTS and MS 

- O interface : connects OMC to all elements



###### Databases

- HLR=Home Location Register 
- VLR=Visitor Location register 
- EIR=Equipment Identity Register 

- AuC=Authentication Centre



#### GSM: Radio Subsystem

-- The radio subsystems (RSS) comprises the cellular mobile network up to switching center

<img src="/Users/xueyiwei/Library/Application Support/typora-user-images/Screen Shot 2020-11-01 at 10.51.29 PM.png" alt="Screen Shot 2020-11-01 at 10.51.29 PM" style="zoom:50%;" />

###### Components

- MS (Mobile Station)

- BSS (Base Station Subsystem):
  - BTS (Base Transceiver Station):sender and receiver, radio components including sender, receiver, antenna - if directed antennas are used one BTS can cover several cells
  - BSC (Base Station Controller):controlling several transceivers, switching between BTSs, controlling BTSs, managing of network resources, mapping of radio channels (Um ) onto terrestrial channels (A interface)
  - BSS = BSC  + sum(BTC) + interconnection

###### Interfaces

- Um : radio interface

- Abis : standardized, open interface with 16 kbit/s user channels
  - Interface between BTS and BSC
  - Non-standardised interface, manufacturers follow certain guidelines
  - Based on transmission of data on a PCM 30 interface (2.048Mb/s transmission rate partitioned into 32 channels of 64 kb/s each)
  -  Voice compression can pack between 4 and 8 voice channels into single PCM 30 channel

- A: standardized, open interface with 64 kbit/s user channels
  - Interface between BSS and MSC
  - Standardised interface allows mixing of equipment from different manufacturers
  - A-Interface at physical level consists of two parts
  - First part between BSS and TRAU, transmission payload is still compressed
  - Second part between TRAU and MSC A-Interface at higher layers depends on SS7 MTP and
  - SCCP to carry BSSA



##### Mobile Station (MS)

- An MS is any fixed or mobile device which can be used to access the GSM network.

- Five RF power levels are defined : 20W, 8W, 5W, 2W and 0.8W

- RF power can be reduced in 2 dB steps down to 20 mW

- BTS measures power and signals MS to change power in 2 dB steps every 13 TDMA frames (60 ms)



<img src="/Users/xueyiwei/Library/Application Support/typora-user-images/Screen Shot 2020-11-02 at 11.17.17 AM.png" alt="Screen Shot 2020-11-02 at 11.17.17 AM" style="zoom:50%;" />



• Every MS is uniquely identified by an IMEI (International Mobile Equipment Identity). One function of the IMEI is to verify the identity of the MS in the event of loss, theft or fraud.

• The subscriber is uniquely identified by the Subscriber Identity Module (SIM) which is inserted into the MS, but can be removed and inserted into a different MS. 

• MSISDN - Mobile Subscriber ISDN Number is the number called by a party that wishes to contact the subscriber (the “phone number”). ISDN: integrated service digital network

• IMSI - International Mobile Subscriber Identity identifies a subscriber inside the mobile network

• TMSI - Temporary MSI used to enhance security

• Billing and routing done on the basis of the subscriber not the equipment - using the SIM to identify the subscriber



###### Functions of MS

1. Voice and data transmission

   – digitising, encoding, error protecting, encrypting and modulation as well as inverse

2. Frequency and time synchronisation

   – MS tunes to a certain TDMA slot specified by the BSC

3. Monitoring signal strength and quality from surrounding cells

   – BER of synchronisation sequence of signals from <7 cells measured and communicated to BSC – contributes to handover calculations

4. Provision of location updates

   – periodic or forced - allows paging a MS in the correct LA

5. Equalisation of multipath distortions

   – adjusted every frame

6. Display of short messages (SMS)

7. Timing advance

   – calculated by BTS and required advance sent to MS



##### Subscriber Identification Module (SIM)

​	• The SIM is a smart card which is inserted into the MS

​	• The SIM contains a single chip computer with it’s own Operating System, File System, applications etc.

​	• Smart Card contains security keys, network identifiers (IMSI, MSISDN) and algorithms

​	• SIM security is protected by PIN

​	• SIM can be moved from one MS to another.

​	• SIM applications can be written with SIM Toolkit



##### Base Transciver Station (BTS)

​	– Radio transmission and reception

​	– Wireless channel encryption

​	– Conversion between wired and wireless signals

​	– Frequency Hopping

​	– There is very little “intelligence” in the BTS



##### Base Station Controller (BSC)

​	– Controls several BTS

​	– Locates the MS (paging)

​	– Controls handovers	

​	– Translates GSM 13-Kbps voice to standard 64-Kbps format

​	– Operation and maintenance functions of the BSS



##### Mobile Switching Center (MSC)

- The MSC is a critical central component of the network

- MSC is basically a high performance telephony switch, which handles functions specific to mobile subscribers :

  ​	–Registration

  ​	–Authentication

  ​	–Handover management

  ​	–Billing (generation of CDR files)

- A Gateway MSC (GMSC) handles interconnection with other networks (PSTN, ISDN etc.)



##### GSM Database

###### Home Location Register (HLR)

​	• database of all users registered on that network (one HLR per network)

​	• Stores current location of the subscriber

​	• Regularly updated when MS changes location 

###### Visitor Location Register (VLR)

​	• A database of all users and roamers in the geographic area.

​	• Stores TMSIs and MSRNs

​	• Caches the HLR

###### Equipment Identity Register (EIR)

​	• Stores the IMEI numbers for all MS on the network 

###### Authentication Centre (AuC)

​	• Stores the authentication keys used for authorizing the subscriber access to the associated GSM PLMN.

###### Noting

- The VLR temporarily stores information about the mobile stations that are active within a given MSC’s location area.

- The HLR, VLR, and AuC comprise the management databases that support roaming (including international roaming) in the GSM network.

- There is a VLR associated with each MSC in the network.

- Having a local cache of HLR data in the VLR avoids frequent HLR database updates and long distance signalling of the user information, allowing faster access to subscriber information.

###### Roaming

- When a new subscriber roams into a location area, the VLR copies subscriber information from the home network HLR to its local database.

- The VLR is responsible for allocating a Mobile Station Roaming Number (MSRN) and Temporary Mobile Subscriber Identity (TMSI) to visiting roamers, when required to route incoming (MT) calls.

- Together the HLR and VLR support roaming in a GSM network.

- VLR activated when a new subscriber roams into a location area.

  • Stores information about MSs active in that area.

- Subscriber information copied from home HLR to location VLR.

  • Reduces long distance signalling of user information.

  • Allows faster access to subscriber information.

  • Prevents frequent HLR database updates.

- VLR allocates two numbers to route incoming calls:

  • A Mobile Station Roaming Number (MSRN)

  • A Temporary Mobile Subscriber Identity (TMSI)



























































