# IVR
**Assignment 1** 

**Computer Vision – Playing Card Detection**  

**Intro to Vision & Robotics: Spring 2015** 

---------- 

**Due:**	Program due 4pm Thursday February 26 ;  
	  

Current status & instructions:

load & set variable  for original image
original = imread('train1.jpg');
segment image & set variable (produces a binary image)
 binary = segmentimage('train1.jpg', 0);
Use binary image to produce color image of items past the threshold
colorDetect(original, binary);

This will produce 3 figures: the original image, the color image with threshold applied, and the three color band histograms.
