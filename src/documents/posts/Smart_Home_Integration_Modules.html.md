```
title: Smart Home Integration Modules
layout: post
tags: ['outro','post']
```
Contents
--------

[Component Description](#Component_Description)

[Potential Applications](#Potential_Applications)

[Technologies](#Technologies)

[Data interface for KNX component](#Data_interface_for_KNX_component)

-   [Input Ports](#Input_Ports)
-   [Properties](#Properties)
-   [Event Listeners](#Event_Listeners)
-   [Events Triggers](#Events_Triggers)

[Data interface for enOcean component](#Data_interface_for_enOcean_component)

-   [Input Ports](#Input_Ports_2)
-   [Properties](#Properties_2)
-   [Event Listeners](#Event_Listeners_2)
-   [Events Triggers](#Events_Triggers_2)

[Licence Information](#Licence_Information)

[Further Resources](#Further_Resources)

* * * * *

Smart Home Integration Modules
------------------------------

Keywords: Assistive Technologies, Sensor, Actuator, Microcontroller, KNX, EnOcean, Environmental Control Systems, Contact: [FHTW](/FHTW "FHTW")

### Component Description

Several components provide access to standardized building automation and smart home control systems: The KNX component interfaces with a KNX-IP router which connects a [KNX](http://www.knx.org "http://www.knx.org") network with various actuators and sensors. The KNX network is configured via the ETS software which makes it possible to assign group- and device addresses to the sensors and actuators, which can then be accessed from the AsTeRICS KNX plugin. The underlying software library for the KNX-specific functionalities is [Calimero](http://sourceforge.net/p/calimero/wiki/Home/ "http://sourceforge.net/p/calimero/wiki/Home/")

[EnOcean](http://www.enocean.com/en/home/ "http://www.enocean.com/en/home/") is an engergy-harvesting wireless sensor network widely used in home- and building automation tasks. As KNX, enOcean provides many different sensors and actuators for smart home control and management. This component utilizes the Priscilla java library for the EnOcean implementation. The EnOcean plugin provides an interface to the EnOcean sensors over an USB stick (EnOcean USB300) or an IP gateway. Interfacing to EnOcean devices is possible either by sending different data to actuators or receiving different types of values. This allows control of lightning, heat and ventilation devices and many more via the AsTeRICS platform.

### Potential Applications

-   Controlling lighting, heating/ventilation, blend motors, and many other building automation devices and facilities with alternative user interfaces / GUI
-   Using KNX / EnOcean sensors for assistive purposes

### Technologies

The components are realized as part of the building block [AsTeRICS AT Modules](/AsTeRICS_AT_Modules "AsTeRICS AT Modules") which provide the AsTeRICS Runtime Environment (ARE) that forwards the data to a websocket interface or vice versa from a websocket interface to the KNX, and enOcean components.

#### Data interface for KNX component

The KNX plugin establishes a connection to the KNX gateway specified by the plugin properties. The plugin has three different possibilities to interface KNX datapoints. The easiest way is to use the slider input ports, which are intended to be used to control dimming actuators. These ports always expect integer values (ports are of the type double but these are typecasted) and forward the value to a groupaddress specified by the plugin properties. The second way to send data to a KNX data point is by the 6 event listeners. Each of them can be configured individually by the plugin properties. The most universal way to send KNX commands is to use the command input of the KNX plugin. It expects a special formatted string and parses the dedicated keywords and format to a KNX command. The string can be assembled individually with other string formatting plugins. The KNX plugin has also some Event Trigger which can be assigned to various KNX Group Addresses within the properties. The KNX plugin listens to the bus and each time a massage with a specified Trigger Group Address is recognized an Event Trigger is issued. This kind of event handling requires dedicated KNX infrastructure setup.

##### Input Ports

-   command [string]: This port receives string commands for the KNX component. The commands have to be in the format "@KNX: group\_address\#type\#value". An example for a valid command is"@KNX:1/1/1\#boolean\#true". As a valid command is received by the input port, the value is sent to the KNX group address. The group addresses comply to the setup of the KNX network which can be configured with the ETS software.
-   slider[1-6] [double]: Input port for a double value which is converted to an integer and forwarded to a dedicated KNX datapoint

##### Properties

-   localIP [string]: The local IP address of the interface which can reach the KNXnetIP.
-   KNXNetIP [string]: The destination IP address of the KNX gateway.
-   NAT [boolean]: Enable Network Address Translation
-   groupAddress[1-6] [string]: (Event Listener) Specifies KNX group addresses for the [n] Event Listener e.g. "1/1/1".
-   dataType[1-6] [string]: (Event Listener) Specifies the data type of the dataValue[1-6] which is send to the KNX datapoint. The data type for values to be sent to the KNX group addresses. Following type are supported: boolean, int, float, string
-   dataValue[1-6] [string]: (Event Listener) Specifies the data which will be converted to the coresponding data type.
-   groupAddressSlider[1-6] [string]: Specifies KNX group addresses for the Slider[n].
-   groupAddressTrigger[1-6] [string]: Specifies KNX group addresses for the Event Trigger [n].

-   A0 - A5 [integer]: The readings of the 6 analog channels of the Arduino (0-1023)

##### Event Listeners

-   send[1-6]: Each time a event is triggered, the coresponding KNX command which is specified in the plugin properties, is issued.

##### Events Triggers

-   event\_out\_[1-6]: Each time a event is triggered, the coresponding KNX command which is specified in the plugin properties, is issued.

#### Data interface for enOcean component

The EnOcean plugin establishes a connection to the EnOcean gateway specified by the plugin properties (defined by gatewayIP and USB checkbox). The gatewayIP is either the IP adress of the gateway or the COM port name (e.g. COM1 or /dev/ttyUSB0). There are 3 different ways of sending data to EnOcean devices. The first one is done by the 6 input slider ports. Each of them has properties for the source device ID (range: 0-127) and a data type (binary, temperature, illumination, humidity, temperature set point and fan level). On every update of the input data, an EnOcean data frame is generated and sent. The second method is done over the event input ports. There are 3 properties to define. The device ID and the data type have equal possible values as with the slider input. The third property defines the value to be sent. The first method is the most flexible one, by sending a command string to the command input port. It expects a special formatted string and parses the dedicated keywords and format to an EnOcean command. The string can be assembled individually with other string formatting plugins. Receiving sensor data is done by combining event and output ports. There are 2 properties, one for the type of input data (the data type are the same as stated before) and one for the source device ID (this property is a hexadecimal string, containing the full 32bit ID, printed on the sensor). The event ports are triggered each time, an event with the defined type and device ID is received. If an event is raised, at the same time the corresponding data value is available at the output ports.

##### Input Ports

-   command [string]: This port receives string commands for the EnOcean devices. The commands have to be in the format "@ENOCEAN:device\_id\#type\#value". An example for a valid command is"@ENOCEAN:25\#binary\#true". As a valid command is received by the input port, the value and data type is broadcasted to the devices with the given device ID offset (range: 0-127)
-   slider[1-6] [double]: Input port for a double value which is converted to an integer (or another type, depends on the datatype) and broadcasted to all EnOcean devices in range

##### Properties

-   localIP [string]: The local IP address of the interface which can reach the IP gateway.
-   gatewayIP [string]: The destination IP address of the EnOcean gateway or the device name of the USB gateway (emulates a serial interface, e.g. COM1 or /dev/ttyUSB0)
-   USB [boolean]: If checked, then the connection will be established through a serial interface, otherwise through an IP gateway
-   id[1-6] [integer]: Source ID for input event[n]. The range is from 0 to 127.
-   sendType[1-6] [string]: Send type for input event[n]. Following data types are allowed global (for every datatype property, port and event): binary, temperature, illumination, humidity, setpoint, fan
-   dataValue[1-6] [string]: The transmitted value for the input event [n] with the given id[n] and type (sendType[n])
-   IDSlider[1-6] [string]: Source ID for slider[n]. The range is from 0 to 127.
-   sendTypeSlider[1-6] [string]: The data type for sending slider[n] data with IDSLider[n]. The possible data types are stated above
-   IDTrigger[1-6] [string]: Source ID for event trigger[n]. This is a full id, as printed on the device as 6 character string(e.g. FFEFA01C)
-   TypeTrigger[1-6] [string]: The data type for the listening event[n]. If an incoming frame from the give ID (IDTrigger[n]) contains this data type, an event on event port [n] is raised. The possible data types are stated above

##### Event Listeners

-   send[1-6]: Each time a event is triggered, the coresponding EnOcean frame which is specified in the plugin properties, is transmitted.

##### Events Triggers

-   event\_out\_[1-6]: Each time a frame is received with the given parameters (from properties IDTrigger[n] and TypeTrigger[n]), this event is raised

### Licence Information

Originally, the AsTeRICS Runtime Environment (ARE) was licensed under GPLv3. [[1]](http://www.asterics.eu/download/Licenses.pdf) For usage within the P4ALL/GPII project, the ARE and dedicated building blocks can be relicensed under a less restrictive licence. For more information please contact [FHTW](/FHTW "FHTW").

The Priscilla Library used for the EnOcean component is (C)opyrighted by UAS FH Technikum Wien and released under the GNU Lesser General Public License (LGPL).

### Further Resources

[KNX](http://www.knx.org "http://www.knx.org")

[EnOcean](http://www.enocean.com/en/home/ "http://www.enocean.com/en/home/")

[AsTeRICS homepage](http://www.asterics.eu/index.php?id=88 "http://www.asterics.eu/index.php?id=88")

[Videos/Demos](http://www.asterics.eu/index.php?id=55 "http://www.asterics.eu/index.php?id=55")

[Downloads and Documentation](http://www.asterics.eu/index.php?id=26 "http://www.asterics.eu/index.php?id=26")

[Code Repository](https://github.com/asterics/AsTeRICS "https://github.com/asterics/AsTeRICS")
