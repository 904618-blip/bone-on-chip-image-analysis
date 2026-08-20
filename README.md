# Bone-on-Chip Image Analysis

This repository contains custom Fiji/ImageJ macros used for image processing and quantitative analysis in a bone-on-a-chip study investigating osteoblast responses and collagen matrix organization under high-glucose and inflammatory conditions.

## Analysis macros

### RUNX2 nuclear/cytoplasmic quantification

`RUNX2_Nuclear_Cytoplasmic_Quantification.ijm`

Segments nuclear and cytoplasmic regions and quantifies RUNX2 fluorescence intensity within each compartment for subsequent calculation of the nuclear-to-cytoplasmic (N/C) fluorescence intensity ratio.

### Osteocalcin (OCN) fluorescence quantification

`OCN_Fluorescence_Quantification.ijm`

Segments phalloidin-positive cells, defines a background region of interest (ROI), and quantifies OCN fluorescence intensity for subsequent corrected total cell fluorescence (CTCF) calculation.

### SHG collagen image analysis

`SHG_Collagen_Image_Analysis.ijm`

Quantifies collagen fiber area fraction, inter-fiber spacing, and fiber coherency from second harmonic generation (SHG) images using thresholding, distance-map analysis, and the OrientationJ plugin.

## Software

The macros were developed and executed using Fiji/ImageJ.

The SHG collagen analysis requires the OrientationJ plugin.

## Workflow and reproducibility

The macros implement standardized image-processing and analysis procedures used in the associated study. Image-processing and analysis parameters were fixed prior to batch processing and applied uniformly across experimental conditions.

Some steps require user interaction, including image/channel selection and export of measurement results. Subsequent segmentation, thresholding, and image-processing operations are performed according to the parameters specified within each macro.

## Associated manuscript

These macros accompany a manuscript investigating cellular and extracellular matrix responses in a microfluidic three-dimensional bone-on-a-chip model under high-glucose and inflammatory conditions.

## Author

Veronica Sosa Castellano
