OCN Fluorescence Quantification
//
// Purpose:
// Fiji/ImageJ macro used to segment phalloidin-positive cells,
// define a background region of interest (ROI), and quantify
// osteocalcin (OCN) fluorescence intensity for subsequent
// corrected total cell fluorescence (CTCF) calculation.
//
// Software:
// Fiji/ImageJ
//
// Associated study:
// Bone-on-chip image analysis
//
// Author:
// Veronica Sosa Castellano
//
// Version: 1.0
//
// This macro corresponds to the OCN image-analysis workflow
// described in the associated manuscript.


// Clear ROI manager 
roiManager("Reset");

// Select Phalloidin
waitForUser("Select Phalloidin");
rename("Phalloidin");
run("Green");
run("Duplicate...", " ");

// Select OCN
waitForUser("Select OCN");
rename("OCN-1");
run("Red");
run("Duplicate...", " ");

// Segment cells with Phalloidin
selectWindow("Phalloidin-1");
run("8-bit");
run("Enhance Contrast...", "saturated=0.4 normalize");
run("Gaussian Blur...", "sigma=1.5");

// Set the threshold
setThreshold(35, 255);
setOption("BlackBackground", false);
run("Convert to Mask");
run("Fill Holes");

// Create ROIs
run("Analyze Particles...", "size=200-Infinity show=Masks add");

// NOW switch to OCN before selecting background 
selectWindow("OCN-1");

// Select background (manually)
waitForUser("Draw a background ROI in OCN and then click OK");
roiManager("Add");

// Measure Background 
roiManager("Select", roiManager("count")-1);
roiManager("Measure");

// Measure OCN intensity within the cell ROI 
roiManager("Select", 0); 
roiManager("Measure");

// Manual inspection of the ROIs is recommended before exporting the measurements.

// Example command for automatic export (optional)
