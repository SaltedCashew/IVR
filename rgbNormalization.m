% This function is used to reduce the effect of varying intensity in an
% image. It achieves this through normalizing the RGB spectrums of
% localImage.

function normalized_image = rgbNormalization(localImage)
    % load the unnormalized rgb image
    rgb_image = double(importdata(localImage,'jpg'));
    
    % slice image into its red, blue, and green components
    red_image = rgb_image(:,:,1);
    green_image = rgb_image(:,:,2);
    blue_image = rgb_image(:,:,3);
    
    [r,c] = size(rgb_image(:,:,1));

    for i = 1:r
        for j = 1:c
            
            % get rgb values for each pixel
            red = red_image(i,j);
            green = green_image(i,j);
            blue = blue_image(i,j);
            
            % if the pixel is truly black, then avoid divide by 0 error and
            % replace normalized value with 1/sqrt(3)
            if (red == 0 && blue == 0 && green == 0)
               
                norm_red = 0;
                norm_green = 0;
                norm_blue = 0;
                
            else
            
                % normalize the rgb values for each pixel
                norm_red = red/sqrt(red^2 + green^2 + blue^2);
                norm_green = green/sqrt(red^2 + green^2 + blue^2);
                norm_blue = blue/sqrt(red^2 + green^2 + blue^2);
            
            end
            
            % insert normalized rgb into appropriate spectrum of image
            red_image(i,j) = norm_red * 256;
            green_image(i,j) = norm_green * 256;
            blue_image(i,j) = norm_blue * 256;
            
        end
    end
    
    % stack the normalized slices into normalized image
    rgb_image(:,:,1) = red_image;
    rgb_image(:,:,2) = green_image;
    rgb_image(:,:,3) = blue_image;
    
    % cast to uint8 for compatiblity with the rest of the lab
    normalized_image = uint8(rgb_image);
end

