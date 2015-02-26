% This function is the primary driver for our shape recognition algorithm.
% It orchestrates all the different methods into a cohesive unit. For
% brevity's sake, details of its functionality can be found in our report.

function main = cardDriver(image)
jon = 0; %used for debuging
original = imread(image);

% extract the color of the card
guessedColor = color(original);

% if the card is red, use rgbNormalization to make intensity uniform
if(strcmp(guessedColor, 'red')==1)
    modifiedimage = rgbNormalization(image);

% if the card is black, remove small artifacts and intensify background
else
    background = imopen(original,strel('disk',5));
    modifiedimage = background + original;
end

% transform normalized image into a binary image
binaryimage = segmentimage(modifiedimage, guessedColor);

% remove any objects that are not at least 150 contiguous bits large
mainimg = bwareaopen(binaryimage, 150);
%imshow(mainimg);

% create bounding boxes
[label, numObjects] = bwlabel(mainimg);
props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 numObjects]);

figure('name', 'Bounding Boxes');
imshow(original);

% determine the number of symbols on the card
count = getSymbolCount(mainimg);

% numObjects is equal to the number of symbols in the image; card # = #
% symbols - 4
cardNumber = count - 4;

hold on; %drawing bounding boxes
for cnt = 1:numObjects
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;

commonSuit = classifyCard(mainimg, guessedColor, jon);

figure('name', 'Binary Image');
imshow(mainimg);
main = strcat(num2str(cardNumber), {' '},'of', {' '}, commonSuit);
disp(strcat( main, 's'));
end
