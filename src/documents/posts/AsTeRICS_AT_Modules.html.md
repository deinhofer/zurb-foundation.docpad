```
title: AsTeRICS AT Modules (Generic Websocket Data Interface)
layout: post
tags: ['outro','post']
```
Contents
--------

[AsTeRICS AT Modules (Generic Websocket Data Interface)](#AsTeRICS_AT_Modules_.28Generic_Websocket_Data_Interface.29)

[Component Description](#Component_Description)

[Potential Applications](#Potential_Applications)

[Technologies](#Technologies)

-   [Definition ACS](#Definition_ACS)
-   [Definition ARE](#Definition_ARE)
-   [Definition Plugin, Port and Event](#Definition_Plugin.2C_Port_and_Event)
-   [Generic Websocket Data Interface](#Generic_Websocket_Data_Interface)

[Operating System](#Operating_System)

[Languages/Libraries](#Languages.2FLibraries)

[User Interface](#User_Interface)

[Licence Information](#Licence_Information)

[Further Resources](#Further_Resources)

* * * * *

AsTeRICS AT Modules (Generic Websocket Data Interface)
------------------------------------------------------

Keywords: Assistive Technologies, Sensor Data, Websockets Contact: [FHTW](/FHTW "FHTW")

### Component Description

The “Assistive Technology Rapid Integration and Construction Set” (AsTeRICS) offers a flexible framework for Assistive Technologies (AT), which can be adapted to the motor abilities of users. AsTeRICS is intended to ease access to different devices such as personal computers, cell phones and smart home devices via one single platform which offers many different input methods. One input method that works well for a user may be used in different contexts – e.g. the same method for accessing the computer mouse function may be used to operate the home stereo. The various capabilities of the AsTeRICS system include PC input device emulation, game control, environmental control applications and utilization of embedded devices. AsTeRICS provides an affordable system for developing user driven AT by combining sensors like webcams, accelerometers, digital switches, sip/puff sensors and special mice/joysticks with basic actuators enabling mouse emulation, door openening, homecontrol.

### Potential Applications

Choose an input modality best suiting your needs:

-   Use a webcam and tracking of face movements to control a computer
-   Use a sip/puff sensor to control a computer
-   Use any joystick, keyboard, special mouse or special AT device as a joystick, keyboard or mouse to control a computer
-   Use EMG/EEG biosignal acquisition to trigger actions

Use your input modality of choice to do:

-   Home automation
    -   Switch on/off light
    -   Control TV/Stereo
    -   Open/Close door

-   Remote control toys [](/Http://www.asterics.eu/index.php%3Fid%3D65 "http://www.asterics.eu/index.php?id=65")[http://www.asterics.eu/index.php?id=65](http://www.asterics.eu/index.php?id=65 "http://www.asterics.eu/index.php?id=65")
-   and many more !

### Technologies

The following section explains several important concepts to understand and use the AsTeRICS framework as a whole or individula components in particular:

##### Definition ACS

AsTeRICS Configuration Suite is a graphical editor for easy building and adapting “Assistive Technologies”. For this purpose you use sensors, actuators and processors, which are included in the software. You can connect these elements and build your own individual setup (also called a “model”), which is specially adapted for your needs, easily and fast.

##### Definition ARE

The AsTeRICS Runtime Environment is the basic software framework for all AsTeRICS applications and use-cases. The models built in the ACS will run in the ARE. The ACS can be seen as a configuration program for the ARE.

##### Definition Plugin, Port and Event

The AsTeRICS Construction Set consists of many different plugins (components), where some of them could be interesting for integration into other assitive applications of software frameworks. A plugin can send and receive data via it's output and input ports. This data can be a continous flow of individual values (standard data types are supported: integer, string, boolean, double.) Furthermore, particular Events can be sent or received by plugins via the Event Trigger and Event Listener ports. An Event Listener port waits for an incoming event and can initiate a particular action in the plugin. An Event Trigger port can be used to send an event from the plugin to another one. The internal configuration parameters of a plugin can be influenced via the plugin Properties (which define eg. the mode of operation, a threshold value, or a filename parameter). When used inside the ARE framework, interconnected and configured plugins consitute the overall functionality of the AsTeRICS model.

##### Generic Websocket Data Interface

In the course of P4All a generic bidirectional data interface through a websocket will be provided. This way sensor data can be forwarded to a browser or another application to visualize the data or trigger actions. Vice versa an application can send data to feed in to the AsTeRICS system.

The exact details of the interface are still to be defined and could be adapted to special requirements of implementers if necessary.

#### Operating System

-   Windows XP, Vista, 7, 8
-   A reduced subset will be available on Linux

#### Languages/Libraries

-   Java (JRE-Version 7, 32-bit)
-   native libraries
-   [Equinox OSGI](http://www.eclipse.org/equinox/ "http://www.eclipse.org/equinox/")

#### User Interface

-   Java Swing UI

### Licence Information

Originally, the AsTeRICS Runtime Environment (ARE) was licensed under GPLv3. [[1]](http://www.asterics.eu/download/Licenses.pdf) For usage within the P4ALL/GPII project, the ARE and dedicated building blocks can be relicensed under a less restrictive licence. For more information please contact [FHTW](/FHTW "FHTW").

### Further Resources

[AsTeRICS homepage](http://www.asterics.eu/index.php?id=88 "http://www.asterics.eu/index.php?id=88")

[Videos/Demos](http://www.asterics.eu/index.php?id=55 "http://www.asterics.eu/index.php?id=55")

[Downloads and Documentation](http://www.asterics.eu/index.php?id=26 "http://www.asterics.eu/index.php?id=26")

[Code Repository](https://github.com/asterics/AsTeRICS "https://github.com/asterics/AsTeRICS")
