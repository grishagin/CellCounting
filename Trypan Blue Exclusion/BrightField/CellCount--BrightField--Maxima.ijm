macro "CellCount--BrightField--Maxima" {

//show prompt for selection of source directory
dir = getDirectory("Choose source directory");
list = getFileList(dir);	//get the file list
resultsFileName = "Cell counting results (Maxima).txt"

setBatchMode(true);	//hide all the details from user
//process every file...
for (i=0; i<list.length; i++) {
		
	//...that has .jpg extension
	if (endsWith(toUpperCase(list[i]), ".JPG")) {
		open(dir+list[i]);
		
		//smooth the image 20 times
		for (j=0; j<20; j++) {
			run("Smooth");
		}
		//find intensity maxima
		run("Find Maxima...", "noise=20 output=[Count] exclude light");
		selectWindow(list[i]);
		close();
	}
}
//summarize all data and copy the results
run("Summarize");
String.copyResults();
setBatchMode(false);

//create a text file with counting results
saveAs("Results",dir+resultsFileName);
}
