```
title: Open Source Input Transducer Prototyping Module
layout: post
tags: ['outro','post']
```
Contents
--------

[Component Descriptions](#Component_Descriptions)

[Potential Applications](#Potential_Applications)

[Technologies](#Technologies)

[Tool chain for the microcontroller](#Tool_chain_for_the_microcontroller)

[Data interface](#Data_interface)

-   [Input Ports](#Input_Ports)
-   [Output Ports](#Output_Ports)
-   [Event listeners](#Event_listeners)
-   [Event Triggers](#Event_Triggers)
-   [Properties](#Properties)

[Licence Information](#Licence_Information)

[Further Resources](#Further_Resources)

* * * * *

Open Source Input Transducer Prototyping Module
-----------------------------------------------

Keywords: Assistive Technologies, Sensor, Actuator, Microcontroller, Arduino, teensy ,Contact: [FHTW](/FHTW "FHTW")

### Component Descriptions

Microcontroller boards provide a cost-effective and efficient solution to interface computers to the environment, measure sensor values or control actuators. For assisitve application in particular, microcontrollers can be interesting to explore alternative input methods or provide means to interact with or manipulate the environment.

The Arduino component provides an interface to the popular [Arduino Uno microcontroller](http://arduino.cc/de/Main/ArduinoBoardUno "http://arduino.cc/de/Main/ArduinoBoardUno") and makes available analog inputs and digital inputs and outputs. Similarily, an interface to the [Teensy](https://www.pjrc.com/teensy/ "https://www.pjrc.com/teensy/") controllers or other types of microcontroller platforms can be provided on demand.

### Potential Applications

-   Measure analog data of a bend sensor, force sensor, accelerometer, gyrometer, pressure sensors, proximity sensors ...
-   Attach (selfmade) switches/buttons as digital inputs to control computer applications or provide mouse/keyboard alternatives
-   Use digital outputs to control actuators (on/off lights, servo motor,...)

### Technologies

An Arduino UNO microcontroller board or a similar supported microcontroller has to be connected to an USB port. The Arduino CIM firmware must have been uploaded into the microcontroller's flash memory to communicate via the CIM protocol with the respective component of the AsTeRICS Runtime Environmnet. Data is provided as continous data stream. Events are triggered in the case of pin state changes. The state of pins can be controlled through Event listener ports.

#### Tool chain for the microcontroller

-   [WinAVR: C-Compiler, Tools,...](http://winavr.sourceforge.net/ "http://winavr.sourceforge.net/")
-   [AVRStudio: IDE](http://www.atmel.com/microsite/atmel_studio6/ "http://www.atmel.com/microsite/atmel_studio6/")

#### Data interface

(for an explaination of the terms "port", "event listener", "event trigger" and "property" please refer to [AsTeRICS AT Modules](/AsTeRICS_AT_Modules "AsTeRICS AT Modules"))

##### Input Ports

-   pwm3 [integer]: PWM channel 3, output value (range: 0-255). The output signal depends on the mode (PWM or servo PWM)
-   pwm5 [integer]: PWM channel 5, output value (range: 0-255). The output signal depends on the mode (PWM or servo PWM)
-   pwm6 [integer]: PWM channel 6, output value (range: 0-255). The output signal depends on the mode (PWM or servo PWM)

##### Output Ports

-   A0 - A5 [integer]: The readings of the 6 analog channels of the Arduino (0-1023)

##### Event listeners

-   setPin2 - setPin13: An incoming event will set the corresponding digital output pin on the Arduino to high level (5V)
-   clearPin2 - clearPin13: An incoming event will set the corresponding digital output pin on the Arduino to low level (0V)

##### Event Triggers

-   pin2ChangedToLow - pin13ChangedToLow: This event is triggered if the corresponding input pin on the Arduino switches from high to low level (connected to 0V)
-   pin2ChangedToHigh - pin13ChangedToHigh: This event is triggered if the corresponding input pin on the Arduino switches from low to high level (connected to 5V)

##### Properties

-   periodicADCUpdate [integer]: This property defines how often the ADC values are measured and put out on the ports A0-A5 (0=disable ADC)
-   pin2Mode - pin13Mode [integer]: This property defines the mode of the Arduino Pins. The value can be selected via a ComboBox. Possible selections are:
    -   not used
    -   Input without pullup resistor
    -   Input with pullup resistor
    -   output, default low
    -   output, default high
    -   PWM servo (PWM for servo driving, 1-2ms pulse), available only on pin 3,5 and 6
    -   500Hz PWM (normal 0-100% PWM), available only on pin 3,5 and 6

### Licence Information

Originally, the AsTeRICS Runtime Environment (ARE) was licensed under GPLv3. [1] For usage within the P4ALL/GPII project, the ARE and dedicated building blocks can be relicensed under a less restrictive licence. For more information please contact [FHTW](/FHTW "FHTW").

### Further Resources

[AsTeRICS homepage](http://www.asterics.eu/index.php?id=88 "http://www.asterics.eu/index.php?id=88")

[Videos/Demos](http://www.asterics.eu/index.php?id=55 "http://www.asterics.eu/index.php?id=55")

[Downloads and Documentation](http://www.asterics.eu/index.php?id=26 "http://www.asterics.eu/index.php?id=26")

[Code Repository](https://github.com/asterics/AsTeRICS "https://github.com/asterics/AsTeRICS")
