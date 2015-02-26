%used with buildMatrix for building matrices for svms
%not used in final cardDriver for identifying cards but is used to assist
%in making feature vectors to train the SVMs on

function new = testing2(numSymbol) 
%Code taken from http://uk.mathworks.com/help/vision/examples/digit-classification-using-hog-features.html
%Extract HOG features and HOG visualization
%features contained in hog_4x4.
%vis_4x4 allows for plotting

[hog_4x4, vis4x4] = extractHOGFeatures(numSymbol,'CellSize',[4 4]);
hog_4x4 = hog_4x4(1,1:400);

% Show the original image
figure;
subplot(2,3,1:3); imshow(numSymbol);


subplot(2,3,5);
plot(vis4x4);
title({'CellSize = [4 4]'; ['Feature length = ' num2str(length(hog_4x4))]});
new = hog_4x4;

end
