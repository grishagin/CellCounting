macro "Cell_count--Threshold" {

//show prompt for selection of source directory
dir = getDirectory("Choose source directory"); 
list = getFileList(dir);	//get the file list
resultsFileName = "Cell counting results (ccm2).txt"

File.makeDirectory(dir+"Processed_images"); //make directory to store processed images


setBatchMode(true);	//hide all the details from user
//process every file...
	for (i=0; i<list.length; i++) {
	
		//...that has .jpg extension
		if (endsWith(list[i], ".jpg")) {
			
		open(dir+list[i]);
		fileNoExt = split(list[i], ".");

			run("16-bit");	//convert image to 16-bit
			setAutoThreshold("Default");  //run("Threshold...")
			
			run("Convert to Mask");	//convert to mask and analyze
			run("Analyze Particles...", "size=50-1000 circularity=0.00-1.00 show=Outlines clear include summarize");

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
			String.resetBuffer;	//reset string buffer
			for (i=0; i<lines.length; i++) {
				if (i==0){
					File.saveString("",dir+resultsFileName);
					f = File.open(dir+resultsFileName);
				}
				labels = split(lines[i], "\t");
				print(f,labels[1]);
				String.append(labels[1]+"\n");	//append another value to the string
				
			}
			File.close(f);
			
			
				//open the summary file, close the Summary window
			open(dir+resultsFileName);
			selectWindow("Summary");
			run("Close");
			String.copy(String.buffer);	//copy all values into the clipboard
			
setBatchMode(false);

}
