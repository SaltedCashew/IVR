function color = colorDetect(originalImage, binaryImage)
    close all; % Close all figures (except those of imtool.)
    imtool close all; % Close all imtool figures.
    a = size(originalImage); %if this is in color, it will be a 3D array
    b = size(binaryImage);   %Should be a 2D binary image array
    c = originalImage;

    if ( a(1, 1:2) ~= b(1, 1:2) )  %only looks at first two elements for larger than 2D array
        color = 0;
        return;
    end

    columns = a(1,1);
    rows = a(1,2);
    figure;
    imshow(originalImage);
     title('Original Image', 'FontSize', 10);
    for i=1:columns % pixel columns of image
        for j=1:rows % pixel rows
            if (binaryImage(i,j) == 1)
               c(i,j,:)=[255,255,255];  
            end
        end
    end
    
   figure;
    imshow(c);
    title('Binary Image', 'FontSize', 10);
    % Extract the individual color planes.
    redPlane = c(:, :, 1);
    greenPlane = c(:, :, 2);
    bluePlane = c(:, :, 3);
    figure;
    	% Compute and plot the red histogram. 
	hR = subplot(3, 4, 1:4); 
	[countsR, grayLevelsR] = imhist(redPlane); 
	maxGLValueR = find(countsR > 0, 1, 'last'); 
	maxCountR = max(countsR); 
	bar(countsR, 'r'); 
	grid on; 
	xlabel('Gray Levels'); 
	ylabel('Pixel Count'); 
	title('Histogram of Red Band', 'FontSize', 10);
    
% Compute and plot the green histogram. 
	hG = subplot(3, 4, 5:8); 
	[countsG, grayLevelsG] = imhist(greenPlane); 
	maxGLValueG = find(countsG > 0, 1, 'last'); 
	maxCountG = max(countsG); 
	bar(countsG, 'g', 'BarWidth', 0.95); 
	grid on; 
	xlabel('Gray Levels'); 
	ylabel('Pixel Count'); 
	title('Histogram of Green Band', 'FontSize', 10);
    
% Compute and plot the blue histogram. 
	hB = subplot(3, 4, 9:12); 
	[countsB, grayLevelsB] = imhist(bluePlane); 
	maxGLValueB = find(countsB > 0, 1, 'last'); 
	maxCountB = max(countsB); 
	bar(countsB, 'b'); 
	grid on; 
	xlabel('Gray Levels'); 
	ylabel('Pixel Count'); 
	title('Histogram of Blue Band', 'FontSize', 10);       
  	 
end