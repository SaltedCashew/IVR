% This function iterates through all the objects in a binary image. If a 
% given object is the correct compactness and close enough to the average 
% centroid, then the function assumes the object is a suit symbol and try to classify
% it. The method keeps track of the classifications for each suit symbol. Finally, 
% it finds the most common suit classification and returns it as the suit 
% of the card.

function classification = classifyCard(inputImage, guessedColor, jon)

% get the centroid of every object in the binary image
stats  = regionprops(inputImage, 'centroid');
centroids = cat(1, stats.Centroid);

% get the average centroid and the average distance to the average centroid
[averageDist, averageCentroid] = averageCentroidDistance(centroids);
x = averageCentroid(1);
y = averageCentroid(2);

% get a matrix of all the objects in the binary image
[label, numObjects] = bwlabel(inputImage);
props = regionprops(label);

suits = zeros(1,4); % vector that keeps track of the number of each suit detected

% for each object in the binary image, determine if it is a suit symbol; if
% so, determine its suit
for i = 1:size(centroids, 1)
    
    X = [x, y; centroids(i,:)];
    d = pdist(X,'euclidean');
    
    % isolate one symbol with imcrop and determine its compactness
    symbol = imcrop(inputImage, props(i).BoundingBox);
    features = getproperties(symbol);
    compactness = features(1);
    
    % if the distance from the object's centroid to the average
    % centroid is 2.5 times greater than the average distance and the
    % compactness is less than 3, then classify the image using getSuit
    if (d < (2.5 * averageDist)) && (compactness < 3)
        if(jon == 0)
            guessedSuit = getSuit(guessedColor, symbol);
        else
            guessedSuit = 'heart';
        end
        
        % increment the appropriate suit
        if strcmp(guessedSuit, 'heart')==1
            suits(1) = suits(1) + 1;
            
        elseif strcmp(guessedSuit, 'diamond')==1
            suits(2) = suits(2) + 1;
            
        elseif strcmp(guessedSuit, 'club')==1
            suits(3) = suits(3) + 1;
            
        elseif strcmp(guessedSuit, 'spade')==1
            suits(4) = suits(4) + 1;
        end
    end
end

[val, index] = max(suits);
% return the most commonly classified suit
if index == 1
    classification = 'heart';
    
elseif index == 2
    classification = 'diamond';
    
elseif index == 3
    classification = 'club';
    
elseif index == 4
    classification = 'spade';
end

end

