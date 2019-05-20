## Automatic Cell Counting with ImageJ
### Description
This repository containes four ImageJ plugins to count mammalian cells:  
+ In the pictures of cell suspension in a standard hemocytometer.   
  + Bright-field plugins detect ALL cells regardless of their alive/dead status.    
  + Phase contrast plugin detects only live cells (obviously in suspension with trypan blue).
+ In the pictures of differently stained cells.

The following items are included:

1. Trypan Blue Exclusion [folder]
	+ Bright-field [folder]
		- `sample images` (1x dilution)  [folder]
		- `CellCount--ProcessingTemplate--BrightField.xltx`   
		- `CellCount--BrightField--Maxima.ijm`
		- `CellCount--BrightField--Threshold--30.ijm`
		- `CellCount--BrightField--Threshold--100.ijm`     
	+ Phase contrast [folder]   
		- `sample images (2x dilution)`  [folder]   
		- `CellCount--ProcessingTemplate--PhaseContrast.xltx`   
		- `CellCount--PhaseContrast.ijm` 
2. Multicolor [folder]
	- `sample images`  [folder]
	- `CellCount--Multicolor.ijm`
3. README.md  (this file)
4. LICENSE  (GNU GENERAL PUBLIC LICENSE)	
	
	
### Instructions
0. Here's a **[VIDEO](https://youtu.be/0X3AuflpKUM)**.
1. **[DOWNLOAD](http://rsbweb.nih.gov/ij/download.html)** and install ImageJ.  
2. Create a directory (for example, `Cell Counting`) in the ImageJ plugins directory:  
	+ Windows  
	```C:\Program Files\ImageJ\plugins```  
	+ Mac OS X  
	`/Applications/ImageJ/Plugins`  
3. **[DOWNLOAD](https://github.com/grishagin/CellCounting/archive/master.zip)** and unpack the archive with the files:  
4. Extract the _**.ijm**_ files from the archive, and place them into the directory you created.   
5. Launch ImageJ.
6. To launch either macro follow:  
    _Plugins_ > _Cell Counting_ > _**[MACRO NAME]**_   
7. The plugin will prompt you for a **folder** containing the images to be analyzed.
8. Output:
	+ _Maxima_:
		+ File “Cell counting results (Maxima).txt” in the folder with the images analyzed.
		+ Copy of the results in the system clipboard.
	+ _Threshold-N_:
		+ Folder with the processed images in the folder with the analyzed images.
		+ File “Cell counting results (Threshold-N).txt” in the folder with the analyzed images.
		+ Copy of the results in the system clipboard.
	+ _PhaseContrast_:
 		+ Folder with the processed images in the folder with the analyzed images.
		+ File “Cell counting results (PhaseContrast).txt” in the folder with the analyzed images.
		+ Copy of the results in the system clipboard.
 	+ _Multicolor_:
		+ Folder with the processed images in the folder with the analyzed images.
 		+ File “Cell counting results (Multicolor).txt” in the folder with the analyzed images.
		+ Copy of the results in the system clipboard.
9. For Trypan Blue Exclusion macros, you'll have to normalize the data -- effectively, account for how different the size of your picture is compared to the size of the 1x1 mm square on the hemocytometer panel.   
    1. Take a picture of the 1x1 mm square (with or w/o cell suspension).
	1. Locate the picture resolution in picture file properties (`X` pixels by `Y` pixels).
	1. Measure the sides of the square in this picture (`a` by `a` pixels).
	1. Calculate normalization factor `F` = (`a`×`a`)/(`X`×`Y`)
	1. Multiply the cell count reported by macros by `F`.
10. Excel templates are provided to facilitate the data analysis.
