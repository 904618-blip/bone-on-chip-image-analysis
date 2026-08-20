// RUNX2 Nuclear and Cytoplasmic Fluorescence Quantification
//
// Purpose:
// Fiji/ImageJ macro used to segment nuclear and cytoplasmic regions
// and quantify RUNX2 fluorescence intensity within each compartment
// for subsequent calculation of the nuclear-to-cytoplasmic (N/C)
// fluorescence intensity ratio.
//
// Software:
// Fiji/ImageJ
//
// Associated study:
// Bone-on-chip image analysis
//
// Author:
// Verónica Sosa-Castellano
//
// Version: 1.0
//
// Notes:
// The workflow includes manual channel selection and export of the
// Results table. Thresholding and image-processing parameters are
// subsequently applied as defined in the macro.


// Select the phalloidin channel (C2) and assign the green LUT
waitForUser("Select Phalloidin");
rename("Phalloidin");
run("Green");
run("Duplicate...", " ");

// Select the nuclear channel and segment nuclei using Otsu thresholding
waitForUser("Select Core");
rename("Nucleus");
run("Duplicate...", " ");	
setAutoThreshold("Otsu dark");
run("Convert to Mask");
run("Fill Holes");
run("Erode");
run("Dilate");

// Generate a nuclear ROI
run("Create Selection");
roiManager("Add");

// Select Runx2 and set it to red
waitForUser("Select RUNX2");
rename("Runx2");
run("Red");
run("Duplicate...", " ");

// Subtract the nuclear mask from the RUNX2 image to isolate nuclear fluorescence
selectImage("Nucleus-1");
run("Select All");
run("Invert");
imageCalculator("Subtract create", "Runx2-1","Nucleus-1");
run("Duplicate...", " ");
roiManager("Select", 0);
run("Measure");

// Threshold the nuclear RUNX2 signal and perform the measurement
selectImage("Result of Runx2-1-1");
setAutoThreshold("Triangle dark");
run("Convert to Mask");
run("Create Selection");
run("Measure");
roiManager("Deselect");
roiManager("Delete");

// Generate the cytoplasmic ROI by subtracting the nuclear mask from the phalloidin mask
selectImage("Phalloidin-1");
setAutoThreshold("Yen dark");
run("Convert to Mask");
run("Fill Holes");
run("Erode");
selectImage("Nucleus-1");
run("Invert");
imageCalculator("Subtract create", "Phalloidin-1","Nucleus-1");
selectImage("Result of Phalloidin-1");
run("Create Selection");
roiManager("Add");
selectImage("Runx2-1");
roiManager("Select", 0);
run("Measure");
roiManager("Deselect");
selectImage("Phalloidin-1");
run("Invert");
imageCalculator("Subtract create", "Runx2","Phalloidin-1");
selectImage("Result of Runx2");
imageCalculator("Subtract create", "Result of Runx2","Nucleus-1");
roiManager("Select", 0);
setAutoThreshold("Triangle dark");
run("Convert to Mask");
run("Create Selection");
run("Measure");

// Save or export the Results table before continuing
selectWindow("Results");
waitForUser("Save the table results");

// Clear and close ROI Manager
roiManager("Select", 0);
roiManager("Deselect");
roiManager("Delete");
run("Close");

// Close Results
run("Clear Results");
selectWindow("Results");
run("Close");

//Close all images
run("Close All");


