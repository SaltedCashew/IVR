
function binary = segmentimage(localImage, guessedColor, show)
    close all; % Close all figures (except those of imtool.)
    imtool close all; % Close all imtool figures.
    workspace; % Make sure the workspace panel is showing.

    %imshow(localImage);
    % extract a histogram from the grayscale image
    grayImage = rgb2gray(localImage);
    %imshow(grayImage);
    test = adapthisteq(grayImage);
   % imshow(test);
    level = graythresh(test);
    bw = ~im2bw(test,level);
    bw = bwareaopen(bw, 50);
    %imshow(bw)

    localHist = dohist(grayImage, 0);
    
    % compute an appropriate threshold based on the color of the card
    if (strcmp(guessedColor, 'red')==1)
        sublevel = findthresh(localHist, 8, 0);
    else
        sublevel = findthresh(localHist, 2, 0);
    end
    
    % scale the threshold to a number between 0 and 1
    level = sublevel/256;
    
    % finally segment grayscale to create a binary image
    binary = ~im2bw(grayImage, level); %added ~ to coincide with lab requirement
    
    % if the card is black, apply bwmorph to remove extraneous artifacts
    if (strcmp(guessedColor, 'red')~=1)
        binary = bwmorph(binary, 'open',1);
    end
end