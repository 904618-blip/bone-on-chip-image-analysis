# Bone-on-Chip Image Analysis

This repository contains the custom Fiji/ImageJ macros used for image processing and quantitative analysis in a bone-on-a-chip study investigating osteoblast responses and collagen matrix organization under high-glucose and inflammatory conditions.

## Analysis macros

### RUNX2 nuclear/cytoplasmic quantification
`RUNX2_Nuclear_Cytoplasmic_Quantification.ijm`

Quantifies RUNX2 subcellular localization by measuring nuclear and cytoplasmic fluorescence intensities for calculation of the nuclear-to-cytoplasmic (N/C) fluorescence intensity ratio.

### Osteocalcin (OCN) fluorescence quantification
`OCN_Fluorescence_Quantification.ijm`

Segments phalloidin-positive cells, defines a background region of interest (ROI), and quantifies OCN fluorescence intensity for subsequent corrected total cell fluorescence (CTCF) calculation.

### SHG collagen image analysis
`SHG_Collagen_Image_Analysis.ijm`

Quantifies collagen fiber area fraction, inter-fiber spacing, and fiber coherency from second harmonic generation (SHG) images using thresholding, distance-map analysis, and the OrientationJ plugin.

## Software

The macros were developed and executed using Fiji/ImageJ.

The SHG collagen analysis requires the OrientationJ plugin.

## Reproducibility

Image-processing and analysis parameters were fixed prior to batch processing and applied uniformly across experimental conditions.

## Associated manuscript

These macros accompany a manuscript investigating cellular and extracellular matrix responses in a microfluidic three-dimensional bone-on-a-chip model.

## Author

Veronica Sosa-Castellano
