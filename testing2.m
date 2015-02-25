function new = testing2(numSymbol) %used with buildMatrix for building matrices for svms


% Extract HOG features and HOG visualization

[hog_4x4, vis4x4] = extractHOGFeatures(numSymbol,'CellSize',[4 4]);
hog_4x4 = hog_4x4(1,1:500);

% Show the original image
figure;
subplot(2,3,1:3); imshow(numSymbol);


subplot(2,3,5);
plot(vis4x4);
title({'CellSize = [4 4]'; ['Feature length = ' num2str(length(hog_4x4))]});
new = hog_4x4;

end
