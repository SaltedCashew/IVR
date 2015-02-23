function guessedColor = color(originalImage)

    redThresh = 0.20;
    diffRed = imsubtract(originalImage(:,:,1), rgb2gray(originalImage)); % Get red component of the image
    diffRed = medfilt2(diffRed, [3 3]); % Filter out the noise by using median filter
    binRed = im2bw(diffRed, redThresh); % Convert the image into binary image with the red objects as white

    count = 0;
    a = size(binRed); %if this is in color, it will be a 3D array
    columns = a(1,1);
    rows = a(1,2);
    for i=1:columns % pixel columns of image
        for j=1:rows % pixel rows
            if (binRed(i,j) ~= 0)
               count = count + 1;
            end
        end
    end
    

    if count < 10
        guessedColor = 'black';
    else
        guessedColor = 'red';
    end

    
end