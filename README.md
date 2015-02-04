# IVR
**Assignment 1** 

**Computer Vision – Playing Card Detection**  

**Intro to Vision & Robotics: Spring 2015** 

---------- 

**Due:**	Program due 4pm Thursday February 26 ;  
	  

Current status & instructions:
<ol>
<li>load & set variable  for original image
  <li>original = imread('train1.jpg');
<li>segment image & set variable (produces a binary image)
  <li>binary = segmentimage('train1.jpg', 0);
<li>Use binary image to produce color image of items past the threshold
  <li>colorDetect(original, binary);
</ol>

<br><br>
This will produce 3 figures: the original image, the color image with threshold applied, and the three color band histograms.
