```
title: Bioelectric Signal Acquisition and Processing Modules
layout: post
tags: ['outro','post']
```
Contents
--------

[Component Descriptions](#Component_Descriptions)

[Potential Applications](#Potential_Applications)

[Technologies](#Technologies)

[Data interface for the OpenEEG "p2 parser" component](#Data_interface_for_the_OpenEEG_.22p2_parser.22_component)

-   [Output Ports](#Output_Ports)
-   [Properties](#Properties)

[Licence Information](#Licence_Information)

[Further Resources](#Further_Resources)

* * * * *

Bioelectric Signal Acquisition and Processing Modules
-----------------------------------------------------

Keywords: Assistive Technologies, bioelectric signals, openEEG, EMG, EOG, Contact: [FHTW](/FHTW "FHTW")

### Component Descriptions

Bioelectric signal acquisition can serve as a valuable input method for alternative computer interfaces for people with motor disabilities. Using bioelectic measurements liek the ElecroMyogram (EMG), the Electrooculogram (EOG) or the Electroencephalogram (EEG) allows mouse / keyboard control (and thereby full computer control) and even control of prosthesis or external appliances.

Several initiatives have provided means for the affordable acquisition of bioelectric signals, including the openEEG and the openBCI projects. The AsTeRICS components described in this section provide raw data from those devices, which can then be used in futher assistive applications pr in dedicated AsTeRICS models

### Potential Applications

-   Measure EMG, EEG or EOG and use these signals for controlling alternative human-computer interfaces

### Technologies

The currently supported devices are:

-   the [Modular EEG](http://openeeg.sourceforge.net/doc/modeeg/modeeg.html "http://openeeg.sourceforge.net/doc/modeeg/modeeg.html") 6-channel EEG amplifier
-   the [Olimex SMT EEG](https://www.olimex.com/Products/EEG/OpenEEG/EEG-SMT/open-source-hardware "https://www.olimex.com/Products/EEG/OpenEEG/EEG-SMT/open-source-hardware")
-   the [OpenBCI](http://www.openbci.com/ "http://www.openbci.com/") 8-channel EEG/EMG/ECG amplifier
-   other particular devices can be integrated upon request

These devices transfer data to the connected computer via a COM port via a protocol. In case of the ModularEEG, this data protocol is called "P2", and the plugin which supports the connection and provides the raw multichannel bioelectric signals is called "P2 parser". The COM Port number where the device is connected must be specified in the plugin properties.

#### Data interface for the OpenEEG "p2 parser" component

(for an explaination of the terms "port", "event listener", "event trigger" and "property" please refer to AsTeRICS AT Modules)

##### Output Ports

-   Channel1 to Channel6 [integer]: Each output corresponds to the sampled data from its corresponding channel. The values range for -512 to 512. A calibration procedure to obtain the factor for calculation of microvolts must be performed with the amplifier device.

##### Properties

-   COMPort [String]: The name of the COM port, for example COM2 or COM17.
-   Baudrate [Integer]: The baud rate for the transmission. Standard is 57600.

### Licence Information

Originally, the AsTeRICS Runtime Environment (ARE) was licensed under GPLv3. [1] For usage within the P4ALL/GPII project, the ARE and dedicated building blocks can be relicensed under a less restrictive licence. For more information please contact [FHTW](/FHTW "FHTW").

### Further Resources

[AsTeRICS homepage](http://www.asterics.eu/index.php?id=88 "http://www.asterics.eu/index.php?id=88")

[Videos/Demos](http://www.asterics.eu/index.php?id=55 "http://www.asterics.eu/index.php?id=55")

[Downloads and Documentation](http://www.asterics.eu/index.php?id=26 "http://www.asterics.eu/index.php?id=26")

[Code Repository](https://github.com/asterics/AsTeRICS "https://github.com/asterics/AsTeRICS")
