%not used in final cardDriver for identifying cards but is used to assist
%in making feature vectors to train the SVMs on
%used with testing2 to build matrices for svm

function main = buildMatrix(image, show) 

original = imread(image);
imshow(original);

% extract the color of the card
guessedColor = color(original);

% if the card is red, use rgbNormalization to make intensity uniform
if(strcmp(guessedColor, 'red')==1)
    modifiedimage = rgbNormalization(image);

% if the card is black, remove small artifacts and intensify background
else
    background = imopen(original,strel('disk',5));
    modifiedimage = background + original;
%     modifiedimage = original;
    
end

% transform normalized image into a binary image
binaryimage = segmentimage(modifiedimage, guessedColor);

% remove any objects that are not at least 150 contiguous bits large
main = bwareaopen(binaryimage, 150);

% create bounding boxes
[label, numObjects] = bwlabel(main);
props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 numObjects]);



% find the second-highest left symbol--this should be the suit of the card
suitSymbol = imcrop(main, props(6).BoundingBox);
figure
imshow(suitSymbol);
% get the properties of the suit
suitProps = getproperties(suitSymbol);

% disp(numProps);
 main = testing2(suitSymbol);
end