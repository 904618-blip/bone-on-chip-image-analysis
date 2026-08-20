# Bone-on-Chip Image Analysis

This repository contains custom Fiji/ImageJ macros used for image processing and quantitative analysis in a bone-on-a-chip study investigating osteoblast responses and collagen extracellular matrix organization under high-glucose and inflammatory conditions.

## Analysis Macros

### RUNX2 Nuclear/Cytoplasmic Fluorescence Quantification

`RUNX2_Nuclear_Cytoplasmic_Quantification.ijm`

Segments nuclear and cytoplasmic regions and quantifies RUNX2 fluorescence intensity within each compartment for subsequent calculation of the nuclear-to-cytoplasmic (N/C) fluorescence intensity ratio.

### Osteocalcin (OCN) Fluorescence Quantification

`OCN_Fluorescence_Quantification.ijm`

Segments phalloidin-positive cellular regions, enables manual definition of a background region of interest (ROI), and quantifies OCN fluorescence intensity for subsequent corrected total cell fluorescence (CTCF) calculation.

### SHG Collagen Image Analysis

`SHG_Collagen_Image_Analysis.ijm`

Quantifies collagen fiber area fraction, inter-fiber spacing, and fiber coherency from second harmonic generation (SHG) images using fixed thresholding, distance-map analysis, and OrientationJ-based structure tensor analysis.

## Software Requirements

The macros were developed and executed using Fiji/ImageJ.

The SHG collagen image-analysis workflow requires the OrientationJ plugin.

## Workflow and Reproducibility

The macros implement standardized image-processing and quantitative analysis procedures used in the associated study.

Image-processing and analysis parameters were fixed prior to analysis and applied consistently across experimental conditions. Where applicable, these parameters are specified directly within the macros, including thresholding methods, preprocessing settings, particle-size criteria, Gaussian filtering, and OrientationJ analysis parameters.

Some steps require user interaction, including image or channel selection, z-plane selection, background ROI definition, inspection of generated ROIs, selection of an output directory, and recording or exporting measurement results. Subsequent image-processing and analysis operations are performed according to the parameters specified within each macro.

The RUNX2 macro generates nuclear and cytoplasmic fluorescence measurements for subsequent calculation of the RUNX2 nuclear-to-cytoplasmic (N/C) fluorescence intensity ratio.

The OCN macro generates cellular and background fluorescence measurements for subsequent calculation of corrected total cell fluorescence (CTCF).

The SHG macro generates measurements of collagen fiber area fraction, inter-fiber spacing, and fiber coherency.

## Associated Manuscript

These macros accompany a manuscript investigating cellular and extracellular matrix responses in a three-dimensional microfluidic bone-on-a-chip model under high-glucose and inflammatory conditions.

The repository is intended to provide the image-analysis workflows used in the study and to support methodological transparency and reproducibility.

## Author

Veronica Sosa-Castellano

## Version

Version 1.0
