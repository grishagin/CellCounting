Automatic Cell Counting with ImageJ
-------------------------------------
Description
-------------------------------------
This repository containes two ImageJ plugins to count mammalian cells in the pictures of cell suspension in a standard hemocytometer.

The following items are included:

1. README.md  (markdown version of this file)
2. README.txt (this file)
3. CellCountingMacro1-v.1.0.ijm  (plugin #1)
4. CellCountingMacro2-v.1.0.ijm  (plugin #2)
5. sample_images_(1x dilution)  (folder with sample images)
6. LICENSE  (GNU GENERAL PUBLIC LICENSE)

-------------------------------------
Instructions
-------------------------------------
1. Download and install ImageJ:  
http://rsbweb.nih.gov/ij/download.html
2. Download the archive:  
https://github.com/grishagin/CellCounting/archive/master.zip
3. Extract the following two files from the archive:  
    CellCountingMacro1-v.1.0.ijm
    CellCountingMacro2-v.1.0.ijm 
4. Place these files into the ImageJ plugins directory:  
Windows   C:\Program Files\ImageJ\plugins  
Mac OS X	/Applications/ImageJ/Plugins  
5. Launch ImageJ.
6. To launch either Macro 1 or Macro 2, follow:  
    Plugins > CellCountingMacro1-v.1.0  
    Plugins > CellCountingMacro2-v.1.0  
7. The plugin will prompt you for a folder containing the images to be analyzed.
8. Output:
   Macro 1:
     File “Cell counting results (ccm1).txt” in the folder with the images analyzed.
     Copy of the results in the system clipboard.
   Macro 2:
     Folder with the processed images in the folder with the analyzed images.
     File “Cell counting results (ccm2).txt” in the folder with the analyzed images.
     Copy of the results in the system clipboard.
9. Normalize the data via multiplying them by (a×a)/(X×Y), where a – side of the square manual cell counting area in your image (px); X×Y – resolution of your camera (px).
