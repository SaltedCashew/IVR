
function main = cardDriver(image, show)

% if the card is red, use rgbNormalization to make intensity uniform
normalizedImage = rgbNormalization(image, show);


% if the card is black, use some other method
% black method here....
%normalizedImage = importdata(image,'jpg');
original = imread(image);
guessedColor = color(original);
disp(guessedColor);
background = imopen(original,strel('disk',5));
test = (background) + original;
imshow(normalizedImage);
binaryimage = segmentimage(test, show);
morphedimage = bwmorph(binaryimage, 'open',1);



%colorOnly = colorDetect(original, morphedimage);

imagefeatures = getproperties(morphedimage);
main = imagefeatures;

figure, imshow(morphedimage), title('binary image')



[label num] = bwlabel(morphedimage);

props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 num]);
imshow(morphedimage);

hold on;
for cnt = 1:num
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;

end
