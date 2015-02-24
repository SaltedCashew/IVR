function clippedImage = removeFloaties(inputImage)
    
    % remove any objects that are not at least 200 contiguous bits large
    reducedbinaryimage = bwareaopen(inputImage, 150);
    
    % get the centroid of every remaining object
    stats  = regionprops(reducedbinaryimage, 'centroid');
    centroids = cat(1, stats.Centroid);
    %imshow(reducedbinaryimage);
    
    % test theory about N-4 = card #--remove eventually
    %[r,c] = size(centroids);
    %disp(r-4);
    
    % plot individual centroids--remove eventually
%     hold on
%     plot(centroids(:,1), centroids(:,2), 'b*')
%     hold off
    
    % calculate the average centroid (i.e. objects' center of mass)
    averageCentroid = mean(centroids);
    disp(averageCentroid);
    
    x = averageCentroid(1);
    y = averageCentroid(2);
    
    % plot average centroid--remove eventually
%     hold on
%     plot(x,y,'o');
%     hold off
    
    % plot the card boundary (arbitrary width and height)--remove eventually
%     hold on
%     plot(x+100,y+140,'o');
%     plot(x-100,y+140,'o');
%     plot(x+100,y-140,'o');
%     plot(x-100,y-140,'o');
%     hold off
    
    % TODO: remove objects outside of the boundary (i.e. unwanted objects)
    
    clippedImage = reducedbinaryimage;
end

