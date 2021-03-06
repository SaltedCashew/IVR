% This function calculates the average centroid of all objects in a binary 
% image and the distance from each object's centroid
% to the average centroid. These metric can be used to discriminate against
% objects that are too far from a general cluster of objects.

function [averageDist, averageCentroid] = averageCentroidDistance(centroids) 
    
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
    
end

