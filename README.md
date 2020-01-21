# Deformable models

Objective: segmentation of myelinated nerve cells in a sequence of X-ray images

## Description

This project was done as a part of Advanced Image Analysis course at DTU. The data was provided by the lecturers. The samples were  imaged using X-ray phase contrast zoom tomography at the European Synchrotron Radiation Facility (ESRF, Grenoble, France).

Extracting contours of the myelinated nerve cells in a volumetric data can help to understand nerve disorders. By segmenting and connecting shapes of nerves at each image it is possible to restore 3D information about structure of myelinated nerves, allowing for extraction of morphological information.

## Approach

The nerve images are slices of the 3D nerve taken at approximetly equidistant lengths. This results in images that do not change rapidly inbetween images. Therefore, a model that gradually evolves over a squence of images is suitable for this task. Deformable model is a curve that moves under the influence of external and internal forces. The external forces depends on the information from the image. The internal forces imposes prior smoothness to the curve. In this project, curve was represented by a set of points(also called a snake). The external forces were calculated based on Chan-Vese algorithm. Internal forces introducted elasticity(first-order derivitive of the curviture) and ridigity(second-order derivitive of the curviture) to the overall force.

## Results

The below gif shows how three deformable models evolve over a sequence of images.

![](segmentation_gif.gif)


## Future improvements

- more fine tuning of internal forces parameters

- bilinear interpolation of curvature points 
