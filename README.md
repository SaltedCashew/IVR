# IVR
*Assignment 1* 

*Computer Vision – Playing Card Detection*  

*Intro to Vision & Robotics: Spring 2015* 

---------- 

*Due:*	Program due 4pm Thursday February 26 ;  
	  

Current status & instructions:
<ol>
<li>load & set variable  for original image
  <ul><li>original = imread('train2.jpg');</ul>
<li>segment image & set variable (produces a binary image)
  <ul><li>binary = segmentimage('train2.jpg', 0);</ul>
<li>Use binary image to produce color image of items past the threshold
  <ul><li>colorDetect(original, binary);</ul>
</ol>

<br><br>
This will produce 3 figures: the original image, the color image with threshold applied, and the three color band histograms.
<br>
This wraps up this week's lab and takes it a bit further in the hopes of detecting the card color.
