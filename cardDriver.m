
function main = cardDriver(image, show)
binaryimage = segmentimage(image, show);
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
