% to be called with .jpg file. ie: segmentimage('train1.jpg', 1)
% file need not be grayscale

function binary = segmentimage2(localImage, show)
    close all; % Close all figures (except those of imtool.)
    imtool close all; % Close all imtool figures.
    workspace; % Make sure the workspace panel is showing.
    fontSize = 20;
    loaded = importdata(localImage,'jpg');
    gI = rgb2gray(loaded);
    
    background = imopen(gI,strel('disk',15));

    % Display the Background Approximation as a Surface
    figure
    surf(double(background(1:8:end,1:8:end))),zlim([0 255]);
    ax = gca;
    ax.YDir = 'reverse';
    figure
    I2 = gI - background;
    imshow(I2)
    
    figure;
    localHist = dohist(I2, 0);
    sublevel = findthresh(localHist, 8, 0);
    level = sublevel/500;
    binary = im2bw(I2, level); %added ~ to coincide with lab requirement
    if show>0
        imshow(binary)
    end
    
end