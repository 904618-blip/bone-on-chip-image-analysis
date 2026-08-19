// SHG Collagen Image Analysis
//
// Purpose:
// Fiji/ImageJ macro used to quantify collagen fiber area fraction,
// inter-fiber spacing, and fiber coherency from second harmonic
// generation (SHG) images using thresholding, distance-map analysis,
// and the OrientationJ plugin.
//
// Software:
// Fiji/ImageJ
//
// Required plugin:
// OrientationJ
//
// Associated study:
// Bone-on-chip image analysis
//
// Author:
// Veronica Sosa Castellano
//
// Version: 1.0
//
// This macro corresponds to the SHG collagen image-analysis workflow
// described in the associated manuscript.


// Select the image to be analyzed
waitForUser("Click on the correct image and then press OK");

// Enhance contrast on the selected image
run("Enhance Contrast...", "saturated=0 equalize process_all");

// Split the stack into individual images if required
run("Stack to Images");

// Select the image corresponding to the z-plane to be analyzed
waitForUser("Select the Z-plane");

// Rename the selected image
rename("Base");

// Duplicate the base image
run("Duplicate...", "title=Fibers");
run("Duplicate...", "title=Pores");
run("Duplicate...", "title=Orientation");

// 1. FIBER AREA FRACTION

selectWindow("Fibers");
setAutoThreshold("Moments dark");
setOption("BlackBackground", true);
run("Convert to Mask");
run("Set Measurements...", "area_fraction decimal=3");
run("Measure");
waitForUser("Copy AREA FRACTION and save the binary image");

// Save the binary image
dir = getDirectory("Choose output folder");
name = getTitle();
saveAs("Tiff", dir + name + "_binary.tif");
run("Close");

// 2. INTER-FIBER SPACING

selectWindow("Pores");
setAutoThreshold("Moments dark");
run("Convert to Mask");
run("Distance Map");
run("Histogram");
waitForUser("Copy Mean and StdDev from pore histogram and then OK");
run("Close");

// 3. FIBER ORIENTATION AND COHERENCY

selectWindow("Orientation");
run("Gaussian Blur...", "sigma=1");
run("Enhance Contrast...", "saturated=0.3");
run("OrientationJ Distribution", 
    "tensor=7 gradient=4 orientation=on coherency=on histogram=on table=on min-coherency=10 min-energy=5");
selectWindow("OJ-Coherency-1");
run("Set Measurements...", "mean standard min max decimal=3");
run("Measure");
waitForUser("Record the mean and standard deviation of the coherency measurements ");
run("Close All");


