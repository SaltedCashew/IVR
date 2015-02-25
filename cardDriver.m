

function main = cardDriver(image, show)

original = imread(image);
imshow(original);

% extract the color of the card
guessedColor = color(original);

% if the card is red, use rgbNormalization to make intensity uniform
if(strcmp(guessedColor, 'red')==1)
    modifiedimage = rgbNormalization(image, show);

% if the card is black, remove small artifacts and intensify background
else
    background = imopen(original,strel('disk',5));
    modifiedimage = background + original;
%     modifiedimage = original;
    
end

% transform normalized image into a binary image
binaryimage = segmentimage(modifiedimage, guessedColor, show);

% remove any objects that are not at least 150 contiguous bits large
main = bwareaopen(binaryimage, 150);

% create bounding boxes
[label, numObjects] = bwlabel(main);
props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 numObjects]);

% find upper left symbol--this should be the number of the card
numSymbol = imcrop(main, props(1).BoundingBox);

% get the properties of the number
numProps = getproperties(numSymbol);

% find the second-highest left symbol--this should be the suit of the card
suitSymbol = imcrop(main, props(2).BoundingBox);

% get the properties of the suit
suitProps = getproperties(suitSymbol);

figure('name', 'Bounding Boxes');
imshow(main);

% numObjects is equal to the number of symbols in the image; card # = #
% symbols - 4
cardNumber = numObjects - 4;

hold on;
for cnt = 1:numObjects
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;

% based on color of card, use 2 class Bayes classifier to determine suit
if (strcmp(guessedColor, 'red') == 1)
   guessedSuit = getredsuitSVM(suitProps);
  
else
   guessedSuit = getblacksuitSVM(suitProps);
end

countPips = 0;
for i = 1:numObjects
    region = imcrop(main, props(i).BoundingBox);
    regionProps = getproperties(region);
    bool = strcmp(findPipRegions(regionProps), 'true');
    if(bool ==1)
        countPips = countPips + 1;
    end
end
% disp(countPips);

disp(strcat('This card is a', {' '}, num2str(cardNumber), {' '},'of', {' '}, guessedSuit));

end
