macro "Cell_count_colored_cells" {
//made by Ivan Grishagin
//2015-09-17

//show prompt for selection of source directory
dir = getDirectory("Choose source directory"); 
list = getFileList(dir);	//get the file list
resultsFileName = "Cell counting results (ccm4-color).txt"

File.makeDirectory(dir+"Processed_images"); //make directory to store processed images


setBatchMode(true);	//hide all the details from user
//process every file...
	for (i=0; i<list.length; i++) {
	
		//...that has .jpg extension
		if (endsWith(list[i], ".jpg")) {
			
		open(dir+list[i]);
		fileNoExt = split(list[i], ".");
		
			run("Split Channels");	//split channels
			
			//blues - close
			selectWindow(list[i]+" (blue)"); 
			close();
			
			//greens - count
			selectWindow(list[i]+" (green)");  //select green channel window 
			setAutoThreshold("MaxEntropy dark");  //run("Threshold...")
			
			run("Convert to Mask");	//convert to mask and analyze
			run("Analyze Particles...", "size=100-10000 circularity=0.00-1.00 show=Outlines clear include summarize");

				// save the file in a new directory under a new name and close all windows
			saveAs("Jpeg", dir+"Processed_images"+File.separator+"Analysis_of_"+fileNoExt[0]+"_green");  
			close();

			selectWindow(list[i]+" (green)");
			close();
			
			//reds - count
			selectWindow(list[i]+" (red)");  //select green red window 
			setAutoThreshold("Otsu dark");  //run("Threshold...")
			
			run("Convert to Mask");	//convert to mask and analyze
			run("Analyze Particles...", "size=100-10000 circularity=0.00-1.00 show=Outlines clear include summarize");

				// save the file in a new directory under a new name and close all windows
			saveAs("Jpeg", dir+"Processed_images"+File.separator+"Analysis_of_"+fileNoExt[0]+"_red");  
			close();

			selectWindow(list[i]+" (red)");
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
				print(f,labels[0]+"\t"+labels[1]);
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
