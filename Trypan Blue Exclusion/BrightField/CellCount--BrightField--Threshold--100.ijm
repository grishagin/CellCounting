macro "CellCount--BrightField--Threshold--100" {

	//show prompt for selection of source directory
	dir = getDirectory("Choose source directory"); 
	
	//get the file list
	list = getFileList(dir);
	resultsFileName = "Cell counting results (Threshold-100).txt"

	//make directory to store processed images
	File.makeDirectory(dir+"Processed_images"); 

	//hide all the details from user
	setBatchMode(true);	
	
	//process every file...
	for (i=0; i<list.length; i++) {
	
		//...that has a .jpg extension
		if (endsWith(toUpperCase(list[i]), ".JPG")) {

			open(dir+list[i]);
			fileNoExt = split(list[i], ".");

			//convert image to 16-bit
			run("16-bit");

			//run("Threshold...")			
			setAutoThreshold("Default"); 
			
			//convert to mask and analyze
			run("Convert to Mask");	
			run("Analyze Particles...", "size=100-1000 circularity=0.00-1.00 show=Outlines clear include summarize");

			// save the file in a new directory under a new name and close all windows
			saveAs("Jpeg", dir+"Processed_images"+File.separator+"Analysis_of_"+fileNoExt[0]);  
			close();

			selectWindow(list[i]);
			close();			
		}
	}
	
	//copy all relevant contents from the Summary window
	selectWindow("Summary");
	text = getInfo("window.contents"); 
	lines = split(text, "\n"); 
	
	//create a text file with counting results, output only cell count
	//copy the results into clipboard
	//reset string buffer
	String.resetBuffer;
	
	for (i=0; i<lines.length; i++) {
		
		if (i==0){
			File.saveString("",dir+resultsFileName);
			f = File.open(dir+resultsFileName);
		}
		
		labels = split(lines[i], "\t");
		print(f,labels[1]);
		//append another value to the string
		String.append(labels[1]+"\n");	
	}
	
	File.close(f);
	
	//open the summary file, close the Summary window
	open(dir+resultsFileName);
	selectWindow("Summary");
	run("Close");
	
	//copy all values into the clipboard
	String.copy(String.buffer);
				
	setBatchMode(false);

}
