
function main = cardDriver(image, show)
jon = 0; %used for debuging
original = imread(image);
%imshow(original);

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

% determine the number of symbols on the card
count = getSymbolCount(mainimg);

% create bounding boxes
[label, numObjects] = bwlabel(mainimg);
props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 numObjects]);

% find upper left symbol--this should be the number of the card
numSymbol = imcrop(mainimg, props(1).BoundingBox);

% find the second-highest left symbol--this should be the suit of the card
suitSymbol = imcrop(mainimg, props(3).BoundingBox);

figure('name', 'Bounding Boxes');
imshow(original);

% numObjects is equal to the number of symbols in the image; card # = #
% symbols - 4
cardNumber = count - 4;

hold on; %drawing bounding boxes
for cnt = 1:numObjects
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;

pipSymbol = imcrop(mainimg, props(3).BoundingBox);
if(jon == 0)
    guessedSuit = getSuit(guessedColor, pipSymbol);
else
    guessedSuit = 'heart';
end


figure('name', 'Binary Image');
imshow(mainimg);
main = strcat(num2str(cardNumber), {' '},'of', {' '}, guessedSuit);
disp(strcat( main, 's'));
end
