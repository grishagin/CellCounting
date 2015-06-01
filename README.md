##Automatic Cell Counting with ImageJ
###Description
This repository containes two ImageJ plugins to count mammalian cells in the pictures of cell suspension in a standard hemocytometer.

The following items are included:

1. README.md  (this file)
2. LICENSE  (GNU GENERAL PUBLIC LICENSE)
3. Bright-field (folder)
	- sample_images_(1x dilution)  (folder with sample images)
	- CellCounting_Processing_Template-v1.xltx
	- CellCountingMacro1-v1.ijm    (plugin #1)
	- CellCountingMacro2-v1.ijm    (plugin #2)
	- CellCountingMacro2-v1-01.ijm (plugin #2 v1-01)  
4. Phase contrast (folder)
	- sample_images_(2x dilution)  (folder with sample images)
	- CellCounting_Processing_Template-v1-1.xltx
	- CellCountingMacro3-v1.ijm    (plugin #3)

###Instructions
1. Download and install ImageJ:  
http://rsbweb.nih.gov/ij/download.html
2. Download and unpack the archive with the files:  
https://github.com/grishagin/CellCounting/archive/master.zip
3. Extract the following two files from the archive:  
    _CellCountingMacro1-v1.ijm_  
    _CellCountingMacro2-v1-01.ijm_
	_CellCountingMacro3-v1.ijm_  
4. Place these files into the ImageJ plugins directory:  
Windows   C:\Program Files\ImageJ\plugins  
Mac OS X	/Applications/ImageJ/Plugins  
5. Launch ImageJ.
6. To launch either macro follow:  
    Macro 1: _Plugins_ > _CellCountingMacro1-v.1.0_  
    Macro 2: _Plugins_ > _CellCountingMacro2-v1-01.ijm_
	Macro 3: _Plugins_ > _CellCountingMacro3-v1.ijm_ 
7. The plugin will prompt you for a **folder** containing the images to be analyzed.
8. Output:
  +	Macro 1:
    + File “Cell counting results (ccm1).txt” in the folder with the images analyzed.
    + Copy of the results in the system clipboard.
  +	Macro 2:
    + Folder with the processed images in the folder with the analyzed images.
    + File “Cell counting results (ccm2).txt” in the folder with the analyzed images.
    + Copy of the results in the system clipboard.
  +	Macro 3:
    + Folder with the processed images in the folder with the analyzed images.
    + File “Cell counting results (ccm3).txt” in the folder with the analyzed images.
    + Copy of the results in the system clipboard.
9. Normalize the data via multiplying them by (a×a)/(X×Y), where a – side of the square manual cell counting area in your image (px); X×Y – resolution of your camera (px).
