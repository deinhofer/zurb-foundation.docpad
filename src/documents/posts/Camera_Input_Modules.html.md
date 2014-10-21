```
title: Camera Input Modules
layout: post
tags: ['outro','post']
```
Contents
--------

[Component Description](#Component_Description)

[Potential Applications](#Potential_Applications)

[Technologies](#Technologies)

[Operating System](#Operating_System)

[Languages/Libraries](#Languages.2FLibraries)

[Data interface for the FacetrackerLK Module](#Data_interface_for_the_FacetrackerLK_Module)

-   [Output Ports](#Output_Ports)
-   [Event Listeners](#Event_Listeners)
-   [Properties](#Properties)

[Data interface for the Eyetracker Module](#Data_interface_for_the_Eyetracker_Module)

-   [Input Ports](#Input_Ports)
-   [Output Ports](#Output_Ports_2)
-   [Event Listener Ports](#Event_Listener_Ports)
-   [Event Listener Ports](#Event_Listener_Ports_2)
-   [Properties](#Properties_2)

[Licence Information](#Licence_Information)

[Further Resources](#Further_Resources)

* * * * *

Camera Input Modules
--------------------

Keywords: Assistive Technologies, Camera Input, Webcam, Facetracking, Mouse Emulation ,Contact: [FHTW](/FHTW "FHTW")

### Component Description

The camera input modules /(FacetrackerLK and EyeTracker) use a standard webcam or external camera and provide extracted computer vision features like the estimated positions of a users face / nose / chin or the eye pupil position in a live camera image.

### Potential Applications

Use head movements, facial features or eye gaze

-   to control mouse cursor
-   to perform selections in an on-screen keyboard or menu
-   for accessible gaming

### Technologies

The underlying mechanism build upon the [OpenCV library](http://opencv.org/ "http://opencv.org/") (in particular the cascade of haar-like features, the optical flow algorithm and template mathching).

The components are realized as part of the building block [AsTeRICS AT Modules](/AsTeRICS_AT_Modules "AsTeRICS AT Modules") which provides the AsTeRICS Runtime Environment (ARE) that forwards the data to a websocket interface or vice versa from a websocket interface to the component. Data is provided as continous data stream. The camera can be controlled through plugin properties and events.

#### Operating System

-   Windows XP, Vista, 7, 8

#### Languages/Libraries

-   [OpenCV library](http://opencv.org/ "http://opencv.org/")

#### Data interface for the FacetrackerLK Module

(for an explaination of the terms "port", "event listener", "event trigger" and "property" please refer to [AsTeRICS AT Modules](/AsTeRICS_AT_Modules "AsTeRICS AT Modules"))

##### Output Ports

-   noseX [integer]: This value specifies the relative change in the x coordinate of the user's nose with respect to the previous image frame.
-   noseY [integer]: This value specifies the relative change in the y coordinate of the user's nose with respect to the previous image frame.
-   chinX [integer]: This value specifies the relative change in the x coordinate of the user's chin with respect to the previous image frame.
-   chinY [integer]: This value specifies the relative change in the y coordinate of the user's chin with respect to the previous image frame.

##### Event Listeners

-   init: if this action is triggered, the face recognition procedure is initiated. This can be useful if the correct face position has been lost due to drifting of the LK algorithm.
-   showCameraSettings: Triggers the opening of the settings window for the camera device, where parameters like image brightness or contrast can be adjusted.
-   saveProfile: The camera profile is saved.

##### Properties

-   cameraSelection [string, combobox selection]: using this property, the utilized camera can be chosen. Possible values range from “first camera” to “fith camera”. If only one camera is available in the system, “first camera” shall be chosen.
-   cameraResolution [string, combobox selection]: This selection box provides several standard camera resolutions. Changing the resolution affects accuracy and performance (CPU load of the runtime system). Provided selections include “160x120”, “320x240”, “640x480”, “800x600”, “1024x768” and “1600x1200”. If the selectied resolution cannot be delivered by the image acquisition device, the next matching resolution is chosen by the plugin.
-   cameraDisplayUpdate [integer]: This property allows to select the update rate for the camera display in milliseconds. If “0” milliseconds is chosen, no window for the live-video will be displayed. If “100” is chosen, the live image window will be updated 10 times a second. Please note that this property does not influence the frame rate of the camera nor the processing interval for new camera frames, only the display in the GUI is adjusted.
-   cameraProfile [string]: Filename of the camera profile.

#### Data interface for the Eyetracker Module

(for an explaination of the terms "port", "event listener", "event trigger" and "property" please refer to [AsTeRICS AT Modules](/AsTeRICS_AT_Modules "AsTeRICS AT Modules"))

This plugin provides several modes of operation:

-   only blob tracking In this mode, the plugin just outputs the x/y coordinates of a round surface detected in the live camera images. No calibration procedure is needed. The plugins starts immediately with the coordinate output at the ports "x" and "y". A possible application for this mode is tracking of a round marker which could be placed anywhere on the body.
-   calibrated eye tracking In this mode, the plugin expects close-up images of an eye, recorded by a head-mounted setup. The suggested hardware configuration is the AsTeRICS headmounted SVM system (see image below). The eye-pupil location is determined and mapped to an estimated position at the computer screen where the person is looking at. For this mode, the plugins needs to be calibrated. First, a rectangular region of interest (ROI) has to be selected by clicking into the live camera image while holding the CTRL/STRG key. The ROI should cover the area where the eyeball is moving when the user is looking in different directions. Then, the calibration sequence can be started by sending an event to the "calibrate" event listener port. During calibration, the cursor is moved to several locations on the screen and the user is supposed to look at these positions without moving the head. The changing of the cursor position is indicated with an acoustic signal. Calibration succeeds if all calibration location can be recorded without excessively distorted values. If the calibration cannot be accomplished successfully, an acoustic signal is emitted and the Eyetracker plugin does not start to put out x/y data. In this case the calibration procedure has to be repeated.

The coordinate-output of the eye tracking is only working correctly if no head movements occur. Any head movement will compromise the correctness of the x/y estimation for the cursor position.

-   calibrated eye tracking with head pose estimation. This mode is an extension of the "calibrated eye tracking" mode. The calibration has to be performed as above. Additionally to the head-mounted camera, an external LED-frame mounted on the computer monitor is used to minimize the negative effects of head movements to the tracking accuracy. Please note that this mode needs the head-mounted SVM device plus the external Led-Frame.

##### Input Ports

-   pt1x - pt4x [integer]:
-   pt1y - pt4y [integer]: These 8 input ports can be connected to the corresponding output ports of the Sensorboard plugin. The Sensorboard delivers the location of 4 IR-led tracking points in the field-of-view of the IR-object-tracking camera of the headmounted SVM. This information can be used to compensate the head movement to increase gaze estimation stability. The 8 input ports have to be synchronized (turn the synchronized-property on for every input port).

##### Output Ports

-   x [integer]: The x-coordinate delivered by the tracking algorithm. The meaning of this value depends on the selected mode.
-   y [integer]: The y-coordinate delivered by the tracking algorithm. The meaning of this value depends on the selected mode.

##### Event Listener Ports

-   calibrate: if this event is triggered, calibration procedure for the Eyetracker is started (this is not relevant for the mode "only blob tracking").
-   offsetCorrection: this event is useful for eyetracking mode, when a drift of the cursor position has occured. When the event is triggered, the plugin stops the output of x/y coordinates for two seconds, where the user has time to fix the exact cursor position with the eyes. A new offset will be calculated to match the cursor position after the 2 seconds pause.
-   showCameraSettings an incoming event displays the settings window for the camera device, where parameters like image brightness or contrast can be adjusted.
-   togglePoseInfoWindow an incoming event displays the pose info window, where the current location of the 4 IR tracking points for head-pose compensation can be seen. For a normal head orientation these 4 points should be centered in the middle of the window (change the angle of the frontal camera to adjust the position of the yellow dots).
-   startEvaluation an incoming event displays the accuracy evaluation window and starts evaluation. When the user follows the cross to 9 positions in the window, the x/y coordinates of the cursor are stored to a file in the ARE folder which can then be used to calculate and compare the gaze accuracy.
-   saveProfile an incoming event saves the camera settings to a file of the given name (property cameraProfile). Use with caution - a saved settings-profile does only work with the same camera which was used to save the settings.

##### Event Listener Ports

-   blinkDetected: triggered if the blob detection is lost for a timespan bigger than minBlinkDuration and lower than maxBlinkDuration. This can be used for a single eye-blink detection.
-   longBlinkDetected: triggered if the blob detection is lost for a timespan bigger than maxBlinkDuration. This can be used for a long eye-blink detection.

##### Properties

-   cameraSelection [string, combobox selection]: using this property, the utilized camera can be chosen. Possible values range from “first camera” to “fith camera”. If only one camera is available in the system, “first camera” shall be chosen.
-   cameraResolution [string, combobox selection]: This selection box provides several standard camera resolutions. Changing the resolution affects accuracy and performance (CPU load of the runtime system). Provided selections include “160x120”, “320x240”, “640x480”, “800x600”, “1024x768” and “1600x1200”. If the selectied resolution cannot be delivered by the image acquisition device, the next matching resolution is chosen by the plugin.
-   cameraProfile [string] a filename for the camera settings profile to be saved (property cameraProfile). Use with caution - a saved settings-profile does only work with the same camera which was used to save the settings.
-   cameraDisplayUpdate [integer]: This property allows to select the update rate for the camera display in milliseconds. If “0” milliseconds is chosen, no window for the live-video will be displayed. If “100” is chosen, the live image window will be updated 10 times a second. This property does not influence the frame rate of the camera nor the processing interval for new camera frames, only the display in the GUI is adjusted.
-   tracking mode [string, combobox selection]: The selection of the plugin's mode of operation ("only blob tracking", "calibrated eye tracking", or "calibrated eye tracking with head pose estimation")
-   xMin [integer]: the minimum value for the x-coordinate output
-   xMax [integer]: the maximum value for the x-coordinate output. If "0" is selected, the plugins auto-detects the screen resolution and uses the X-Size of the computer screen.
-   yMin [integer]: the minimum value for the y-coordinate output
-   yMax [integer]: the maximum value for the y-coordinate output. If "0" is selected, the plugins auto-detects the screen resolution and uses the Y-Size of the computer screen.
-   calibrationStepsX [integer]: the number of rows for generating calibration positions
-   calibrationStepsY [integer]: the number of columns for generating calibration positions. For example: if 4 x-steps and 3 y-steps are chosen, the user has to look at 12 cursor positions during the calibration phase. More positions increase the gaze-tracking accuracy but result in a longer calibration phase.
-   averaging [integer]: the length of the averaging window for smoothening the ouput values.
-   screenSize [double]: the diameter of the computer screen (important if head pose correction is used)
-   minBlinkDuration [integer]: the minimum time for a short blink to be detected (a short blink is detected if the blink time is bigger than minBlinkDuration and lower than maxBlinkDuration.
-   maxBlinkDuration [integer]: the maximum time for a short blink to be detected (a long blink is detected if the blink time is bigger than maxBlinkDuration).

### Licence Information

Originally, the AsTeRICS Runtime Environment (ARE) was licensed under GPLv3. [[1]](http://www.asterics.eu/download/Licenses.pdf) For usage within the P4ALL/GPII project, the ARE and dedicated building blocks can be relicensed under a less restrictive licence. For more information please contact [FHTW](/FHTW "FHTW").

### Further Resources

[AsTeRICS homepage](http://www.asterics.eu/index.php?id=88 "http://www.asterics.eu/index.php?id=88")

[Videos/Demos](http://www.asterics.eu/index.php?id=55 "http://www.asterics.eu/index.php?id=55")

[Downloads and Documentation](http://www.asterics.eu/index.php?id=26 "http://www.asterics.eu/index.php?id=26")

[Code Repository](https://github.com/asterics/AsTeRICS "https://github.com/asterics/AsTeRICS")
