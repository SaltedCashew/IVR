% This function calculates the average distance from each object's centroid
% to the average centroid. This metric can be used to discriminate against
% objects that are too far from a general cluster of objects.

function average = averageCentroidDistance(centroids) 
    
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
    average = totalDist / size(centroids, 1);
    
end

