% This function counts the number of symbols in a binary image that are
% likely to be either a number or a suit object using a proximity-based
% approach. In short, if an object is too far from the average centroid of
% objects, it is considered some kind of erroneous artifact near the edge
% of the image that thresholding was incapable of removing. Therefore, it
% is not included in the count of symbol objects.

function count = getSymbolCount(inputImage)
    
    % get the centroid of every remaining object
    stats  = regionprops(inputImage, 'centroid');
    centroids = cat(1, stats.Centroid);
    
    % calculate the average centroid (i.e. objects' center of mass)
    averageCentroid = mean(centroids);
    x = averageCentroid(1);
    y = averageCentroid(2);
    
    % calculate the average distance from each object's centroid to the
    % average centroid
    totalDist = 0;
    for i = 1:size(centroids, 1)
        X = [x, y; centroids(i,:)];
        d = pdist(X,'euclidean');
        totalDist = totalDist + d;
    end
    averageDist = totalDist / size(centroids, 1);
    
    % if the distance from the object's centroid to the average
    % centroid is 2.5 times greater than the average distance, then do
    % not count the object
    count = 0;
    for i = 1:size(centroids, 1)
        
        X = [x, y; centroids(i,:)];
        d = pdist(X,'euclidean');
        
        if d < (2.5 * averageDist)
           
            count = count + 1;
            
        end 
    end;
    
    % TODO: remove objects outside of a boundary (i.e. unwanted objects)

end

