% This function is used to determine the color of the playing card. It
% achieves this by isolating the red spectrum from the image, converting it
% to a binary image, and finally counting how many of the remaining pixels
% are considered objects (ie they are primarily red pixels). If this count
% is high enough, then the card can be interpreted as red.

function guessedColor = color(originalImage)

    redThreshold = 0.20;
    diffRed = imsubtract(originalImage(:,:,1), rgb2gray(originalImage)); % Get red component of the image
    diffRed = medfilt2(diffRed, [3 3]); % Filter out the noise by using median filter
    binaryRed = im2bw(diffRed, redThreshold); % Convert the image into binary image with the red objects as white

    count = 0;
    a = size(binaryRed); %if this is in color, it will be a 3D array
    columns = a(1,1);
    rows = a(1,2);
    for i=1:columns
        for j=1:rows
            if (binaryRed(i,j) ~= 0)
               count = count + 1;
            end
        end
    end
    
    % determine if the card is red or black based on how many pixels in the
    % image are primarily red
    if count < 10
        guessedColor = 'black';
    else
        guessedColor = 'red';
    end

    
end