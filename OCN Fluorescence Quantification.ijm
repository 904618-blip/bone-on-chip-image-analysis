// OCN Fluorescence Quantification
//
// Purpose:
// Fiji/ImageJ macro used to segment phalloidin-positive cellular regions,
// enable manual definition of a background region of interest (ROI),
// and quantify osteocalcin (OCN) fluorescence intensity for subsequent
// corrected total cell fluorescence (CTCF) calculation.
//
// Software:
// Fiji/ImageJ
//
// Associated study:
// Bone-on-chip image analysis
//
// Author:
// Veronica Sosa-Castellano
//
// Version: 1.0
//
// Notes:
// This macro corresponds to the OCN image-analysis workflow described
// in the associated manuscript. Cell segmentation is performed using
// fixed preprocessing and thresholding parameters, whereas background
// ROI selection is performed manually.
//
// Manual inspection of generated ROIs is recommended before exporting
// the measurements.


// Clear ROI Manager
roiManager("Reset");


// Select phalloidin channel
waitForUser("Select Phalloidin channel");
rename("Phalloidin");
run("Green");
run("Duplicate...", " ");


// Select OCN channel
waitForUser("Select OCN channel");
rename("OCN-1");
run("Red");
run("Duplicate...", " ");


// Segment phalloidin-positive cellular regions
selectWindow("Phalloidin-1");
run("8-bit");
run("Enhance Contrast...", "saturated=0.4 normalize");
run("Gaussian Blur...", "sigma=1.5");


// Apply fixed threshold
setThreshold(35, 255);
setOption("BlackBackground", false);
run("Convert to Mask");
run("Fill Holes");


// Generate cellular ROIs
run("Analyze Particles...", "size=200-Infinity show=Masks add");


// Switch to OCN image
selectWindow("OCN-1");


// Manually define background ROI
waitForUser("Draw a background ROI in the OCN image, then click OK");
roiManager("Add");


// Measure background fluorescence
roiManager("Select", roiManager("count")-1);
roiManager("Measure");


// Measure OCN fluorescence within the cellular ROI
roiManager("Select", 0);
roiManager("Measure");


// Inspect ROIs and export the Results table before closing
waitForUser("Inspect ROIs and save/export the Results table");
