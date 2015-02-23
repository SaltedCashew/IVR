
function main = cardDriver(image, show)

original = imread(image);
guessedColor = color(original);
disp(guessedColor);

% if the card is red, use rgbNormalization to make intensity uniform
if(strcmp(guessedColor, 'red')==1)
    normalizedImage = rgbNormalization(image, show);
    if (show==1)
        imshow(normalizedImage);
    end
    binaryimage = segmentimage(normalizedImage, guessedColor, show);

    % if the card is black, use some other method
    % black method here....
    %normalizedImage = importdata(image,'jpg');
else
    background = imopen(original,strel('disk',5));
    test = (background) + original;

    binaryimage = segmentimage(test, show);
end



imagefeatures = getproperties(binaryimage);
main = imagefeatures;

figure, imshow(binaryimage), title('binary image')



[label num] = bwlabel(binaryimage);

props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 num]);
imshow(binaryimage);

hold on;
for cnt = 1:num
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;

end
