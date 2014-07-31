##Automatic Cell Counting with ImageJ
###Description
This repository containes two ImageJ plugins to count mammalian cells in the pictures of cell suspension in a standard hemacytometer.

The following items are included:

1. README.md  (this file)
2. CellCountingMacros1-v.1.0.ijm  (plugin #1)
3. CellCountingMacros2-v.1.0.ijm  (plugin #2)
4. sample_images_(1x dilution)  (folder with sample images)
5. LICENSE  (GNU GENERAL PUBLIC LICENSE)

###Instructions
1. Download and install ImageJ:  
http://rsbweb.nih.gov/ij/download.html
2. Download the plugins:  
https://github.com/grishagin/CellCounting/archive/master.zip
3. Place two files  
    _CellCountingMacros1-v.1.0.ijm_  
    _CellCountingMacros2-v.1.0.ijm_  
into the ImageJ plugins directory:   
Windows   C:\Program Files\ImageJ\plugins  
Mac OS X	/Applications/ImageJ/Plugins  
4. Launch ImageJ.
5. To launch either Macros 1 or Macros 2, follow:  
    _Plugins_ > _CellCountingMacros1-v.1.0_  
    _Plugins_ > _CellCountingMacros2-v.1.0_  
6. The plugin will prompt you for a folder containing the images to be analyzed.
7. Output:
  +	Macros 1:
    + File “Cell counting results.txt” in the folder with the images analyzed.
    + Copy of the results in the system clipboard.
  +	Macros 2:
    + Folder with the processed images in in the folder with the analyzed images.
    + File “Cell counting results.txt” in the folder with the analyzed images.
    + Copy of the results in the system clipboard.
