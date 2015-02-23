% to be called with .jpg file. ie: segmentimage('train1.jpg', 1)
% file need not be grayscale

function binary = segmentimage(localImage, guessedColor, show)
    close all; % Close all figures (except those of imtool.)
    imtool close all; % Close all imtool figures.
    workspace; % Make sure the workspace panel is showing.
    %fontSize = 20;
    imshow(localImage);
    %loaded = importdata(localImage,'jpg');
    gI = rgb2gray(localImage);

 
    
    figure;
    localHist = dohist(gI, 0);
    sublevel = findthresh(localHist, 8, 0);
    
    
    if (strcmp(guessedColor, 'red')==1)
        level = sublevel/256;
    else level = sublevel/400;
    end
    
    binary = ~im2bw(gI, level); %added ~ to coincide with lab requirement
    if (strcmp(guessedColor, 'black')==1)
        binary = bwmorph(binaryimage, 'open',1);
    end
end