% testing to see if we can scan every region on the card and detect the
% number of numbers (non-pips) on the card
function count = getNewNumberCount(img, ~)
    load Black_Regions_Hog_Features
    [label, numObjects] = bwlabel(img);
    props = regionprops(label);
    count = numObjects;
   
    nonPips = 0;
   
    for( i =1:numObjects)  
        region = imcrop(img, props(i).BoundingBox);
        [hog_4x4, vis4x4] = extractHOGFeatures(region,'CellSize',[4 4]);
        hog_4x4 = hog_4x4(1,1:500);
        [result,score] = predict(SVMModel,hog_4x4);
        disp(result);
        if(strcmp(result,'spade')~=1) && (strcmp(result,'club')~=1)
           nonPips = nonPips + 1; 
        end
    end
    
    disp(nonPips);
    count = nonPips;
end

