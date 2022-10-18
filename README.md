# Arduino Board Package to Debug Uno/ATmega328P with CH552 debugger in Arduino IDE 2.0.0

**This repo is prepared for students in the Prototyping Electronic Devices class**

## Hardware for debugging

There are 3 hardware options:

### Using CH552 breakout board and ATmega328P on Breadboard

![Debug Arduino on Breadboard](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/debugUnoBreadboard.jpg)

### Using CH552 breakout board and Arduino Uno board

![Debug Arduino Uno board](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/connectRegularUno.jpg)

### Using All in One board

![Debug on All in One board](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/allInOneBoard.jpg)

### CH552 pinout and ATmega328P connection

| CH552 	| ATmega328P 	| Functionality 	|
|-------	|------------	|---------------	|
| P11   	| RST        	| ISP/DEBUG     	|
| P15   	| D11 (MOSI) 	| ISP           	|
| P16   	| D12 (MISO) 	| ISP           	|
| P17   	| D13 (SCK)  	| ISP           	|
| P30   	| D1 (TX)    	| Serial        	|
| P31   	| D0 (RX)    	| Serial        	|
| 5V    	| 5V         	| Power         	|
| GND   	| GND        	| Power         	|

![ch552 pinout](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/ch552Pinout.jpg)

## Software for debugging

### Install driver for Windows user

The debugger does not need any driver for Mac OS. But it does need LibUSB driver for the debugging/programming interface on Windows. Using [Zadig](zadig.akeo.ie) to install the libusb-win32 driver. 

![Install driver on Windows](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/installDriverInWindows.png)

### Burn the bootloader to reset Arduino firmware and fuse

Select **Arduino Uno** from the **Tools->Board** menu, and **USBtinyISP** as the **Tools->Programmer**

Then select **Burn Bootloader**.

If you are able to burn the bootloader, it means the hardware set is ready to be debugged. Your Arduino is also ready to be used as a regular Arduino Uno. 

Note if the Arduino has been debugged before burning the bootloader, your first burn attempt will fail, but the debugger will kick the Arduino out of debugging mode. Your second attempt will be successful. Also replug your board afterward, because Arduino can not enter debug mode again in the same power cycle that you unprogram the DWEN fuse.
 
![burn Bootloader](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/burnBootloader.png) 
 
### Add board support

In Arduino **Preferences**, Click button on the right of the **Additional Boards Manager URLs**

Add:

https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/package_uno_debug_index.json

![add board Url](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/addBoardUrl.png) 

Open **Boards Manager** from **Tools**->**Boards: "Whatever"**->**Boards Manager**

In the **Boards Manager**, Find **Arduino 8-bit with Debug**. Install it.

![install board](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/installBoard.png) 

### Start Debugging

Open BlinkUno.ino with Arduino IDE 2.0.0.

Click **Select Board**, if your board is already plugged in, you should be able to set the board and port automatically.

Or you can manually set the board and port.

![select board](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/selectBoard.png) 

Click **Verify** icon then click the **Start debugging** icon.

Your board should be able to enter debug mode and pause on start.

If you encounter an error. Try to replug the board and debug again.

If it still does not work, try to:

1. Replug the board.
2. Try to burn the bootloader again. (try 2nd time if debugged before).
3. Replug the board.
4. Try to debug again. 

![start debugging](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/startDebugging.png) 

Then you should be able to debug the code.

![debug in progress](https://raw.githubusercontent.com/DeqingSun/unoDebugTestPackage/main/images/debugInProgress.png) 
