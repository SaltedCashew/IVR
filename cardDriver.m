
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

else
    background = imopen(original,strel('disk',5));
    test = (background) + original;

    binaryimage = segmentimage(test, guessedColor, show);
end

main = removeFloaties(binaryimage);

%imagefeatures = getproperties(binaryimage);
%imagefeatures = getproperties(main);

%figure, imshow(binaryimage), title('binary image')
figure, imshow(main), title('main image')

%[label num] = bwlabel(binaryimage);
[label numObjects] = bwlabel(main);

props = regionprops(label);
box = [props.BoundingBox];
%[ul_corner, width] = props.BoundingBox;
box = reshape(box, [4 numObjects]);

% find upper left symbol--this should be the number of the card
numSymbol = imcrop(main, props(1).BoundingBox);
figure('name', 'Card Number');
imshow(numSymbol);

numProps = getproperties(numSymbol);
disp(numProps);

% find the second-highest left symbol--this should be the suit of the card
suitSymbol = imcrop(main, props(2).BoundingBox);
figure('name', 'Suit Symbol');
imshow(suitSymbol);

suitProps = getproperties(suitSymbol);
disp(suitProps);

%imshow(binaryimage);
figure('name', 'Bounding Boxes');
imshow(main);

hold on;
for cnt = 1:numObjects
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;

% based on color of card, use 2 class Bayes classifier to determine suit
if (strcmp(guessedColor, 'red') == 1)
 %  getredsuit(suitProps); 
else
    guessedSuit = getblacksuitSVM(suitProps);
    disp(guessedSuit);
end


end
