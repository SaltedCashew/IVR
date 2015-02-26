% This function 

function classification = classifyCard(inputImage, guessedColor, jon)
    
    % get the centroid of every remaining object
    stats  = regionprops(inputImage, 'centroid');
    centroids = cat(1, stats.Centroid);    
    [averageDist, averageCentroid] = averageCentroidDistance(centroids);
    x = averageCentroid(1);
    y = averageCentroid(2);
    
    [label, numObjects] = bwlabel(inputImage);
    props = regionprops(label);
    
    % if the distance from the object's centroid to the average
    % centroid is 2.5 times greater than the average distance and the
    % compactness is less than 3, then classify the image using 
    
    suits = zeros(1,4);
    for i = 1:size(centroids, 1)
        
        X = [x, y; centroids(i,:)];
        d = pdist(X,'euclidean');
        
        symbol = imcrop(inputImage, props(i).BoundingBox);
        features = getproperties(symbol);
        compactness = features(1);
        
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
    disp(suits(1));
    disp(suits(2));
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

