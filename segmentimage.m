% to be called with .jpg file. ie: segmentimage('train1.jpg', 1)
% file need not be grayscale

function binary = segmentimage(localImage, show)
    close all; % Close all figures (except those of imtool.)
    imtool close all; % Close all imtool figures.
    workspace; % Make sure the workspace panel is showing.
    fontSize = 20;
    loaded = importdata(localImage,'jpg');
    localHist = dohist(localImage, 0);
    sublevel = findthresh(localHist, 6, 0);
    level = sublevel/400;
    binary = im2bw(loaded, level);
    if show>0
        imshow(binary)
    end
    
end