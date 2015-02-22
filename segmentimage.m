% to be called with .jpg file. ie: segmentimage('train1.jpg', 1)
% file need not be grayscale

function morphedimage = segmentimage(localImage, show)
    close all; % Close all figures (except those of imtool.)
    imtool close all; % Close all imtool figures.
    workspace; % Make sure the workspace panel is showing.
    %fontSize = 20;
    imshow(localImage);
    loaded = localImage; %importdata(localImage,'jpg');
    gI = rgb2gray(loaded);

 
    
    figure;
    localHist = dohist(gI, 0);
    sublevel = findthresh(localHist, 8, 0);
    disp(sublevel);
    
    level = sublevel/256;
    binary = ~im2bw(gI, level); %added ~ to coincide with lab requirement
    if show>0
        imshow(binary)
    end
    morphedimage = binary; %bwmorph(binary, 'open',1);
    imshow(morphedimage);
end