# SKShaderBWWindow
Example of SpriteKit shader that works with OpenGL or Metal

This example makes use of the new OpenGL/Metal shader functionality of the SKShader class. The demo shows a picture of a rainbow with an area of the screen that has been converted from color to black and white using a shader. The shader logic has been tested with the OpenGL mode and the Metal mode (see the PrefersOpenGL property in Info.plist). An animation makes the BW area larger and then smaller to demonstrate the dynamic shader result. This example runs at 60 FPS.

![Valid XHTML] (https://raw.githubusercontent.com/mdejong/SKShaderBWWindow/master/BWWindow.png)
