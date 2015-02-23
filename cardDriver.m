
function main = cardDriver(image, show)

% if the card is red, use rgbNormalization to make intensity uniform
normalizedImage = rgbNormalization(image, show);

% if the card is black, use some other method
% black method here....
%normalizedImage = importdata(image,'jpg');

imshow(normalizedImage);
binaryimage = segmentimage(normalizedImage, show);
morphedimage = bwmorph(binary, 'open',1);
%binaryimage = segmentimage2(image, show);
imagefeatures = getproperties(binaryimage);
main = imagefeatures;

figure, imshow(binaryimage), title('binary image')



[label num] = bwlabel(binaryimage);
disp(num);
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
