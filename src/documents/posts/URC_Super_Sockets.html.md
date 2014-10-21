```
title: URC Super Sockets
layout: post
tags: ['outro','post']
```
Contents
--------

[General Background](#General_Background)

[User interface socket](#User_interface_socket)

[Super Sockets](#Super_Sockets)

[Potential Applications](#Potential_Applications)

[Technologies](#Technologies)

-   [Universal Control Hub (UCH)](#Universal_Control_Hub_.28UCH.29)

[Licence Information](#Licence_Information)

[Status, Known Issues & Planned Work](#Status.2C_Known_Issues_.26_Planned_Work)

[Further Resources](#Further_Resources)

[Wiki Categories](#Wiki_Categories)

* * * * *

URC Super Sockets
-----------------

Keywords: Universal Remote Console, Abstract User Interface, Plugable User Interface, Smart Home, Ambient Assisted Living, Contact: [mailto:smirek@hdm-stuttgart.de](mailto:smirek@hdm-stuttgart.de "mailto:smirek@hdm-stuttgart.de")

### General Background

The goal of the Universal Remote Console technology is that every device or service can be accessed and controlled by any control device and user interface that fits the user's needs and preferences, using suitable input and output modalities and interaction mechanisms. This also enables AT vendors and AT experts) to provide supplemental ("pluggable") user interfaces for mainstream products and services, allowing for AT components to be integrated in pluggable user interfaces.

In the following, we refer to the devices and services that are to be controlled as "targets", and to the control devices and their user interfaces as "universal remote consoles" (URCs).

### User interface socket

Each target provides a user interface socket (or short socket), or set of sockets, through which a URC can access part or all of the target's internal states and provide control inputs to the target. For each socket, a target provides a xml file called user interface socket description (or short socket description) which describes the socket in a machine interpretable manner. Additionally the target provides resources that pertain to the user interface of the target, as viewed through that socket. The socket description and resources are used by the URC to find or generate an appropriate user interface, given the functionality of the target, the nature of the URC device, and the user's interaction preferences.

### Super Sockets

Super sockets relate to a certain class of devices and will be provided under the Creative Commons by Attribution License. This gives 3rd parties the possibility to extend the functionality of an existing super socket either by adopting the socket itself or by using the mechanism of inheritance. Hence individual sockets must no more build from scratch.

### Potential Applications

The URC framework and the provided Super Sockets can be used by third parties and adopted to their own products. Super-Sockets will serve as basis for the development of personalized user interfaces to mainstream products in smart homes. They also can be used in the field of Ambient assisted Living.

### Technologies

#### Universal Control Hub (UCH)

The Universal Control Hub (UCH) is a profiling of the Universal Remote Console framework, as specified in ISO/IEC 24752. In this profile, a gateway ("control hub") is used as a middle layer between a controller and a target device or service. The gateway translates between any controller and any target; neither the controller nor the target needs to be URC compatible.

### Licence Information

The URC Super Sockets will be provided under the Creative Commons by Attribution License so that they can be used by third parties and adopted to their own products.

### Status, Known Issues & Planned Work

Our stake of Task 202.4 is to provide Template URC Socket Modules ("super-sockets" by inheritance) for various targets (products and services). Super-Sockets will serve as basis for the development of personalized user interfaces to mainstream products in smart homes. Furthermore we will provide [URC Tutorials](/URC_Super_Sockets_tutorials "URC_Super_Sockets_tutorials") on how to connect AT input components to a URC socket at runtime.

### Further Resources

-   [openURC Alliance](http://www.openurc.org/ "http://www.openurc.org/").
-   [Overview of the Universal Remote Console framework](http://www.openurc.org/TR/urc-overview2.0-20130218/ "http://www.openurc.org/TR/urc-overview2.0-20130218/").
-   [URC Technical Primer 1.0 (DRAFT)](http://www.openurc.org/TR/urc-tech-primer1.0-20121022/ "http://www.openurc.org/TR/urc-tech-primer1.0-20121022/").
-   [URC-HTTP Protocol 2.0](http://www.openurc.org/TR/urc-http-protocol2.0-20131217/ "http://www.openurc.org/TR/urc-http-protocol2.0-20131217/").
-   [Tools and Prototype Implementations for the URC framework](http://myurc.org/tools/ "http://myurc.org/tools/").
-   [Universal Control Hub 1.0 (ATR)](http://www.openurc.org/TR/uch1.0-20131217/ "http://www.openurc.org/TR/uch1.0-20131217/").

Wiki Categories
---------------
