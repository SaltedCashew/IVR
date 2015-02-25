function guessedSuit = getSuit(guessedColor, pipSymbol)
    % based on color of card, use 2 class Bayes classifier to determine suit
    if (strcmp(guessedColor, 'red') == 1)
        
        [hog_4x4, vis4x4] = extractHOGFeatures(pipSymbol,'CellSize',[4 4]);
        hog_4x4 = hog_4x4(1,1:400);
       guessedSuit = getredsuitSVM(hog_4x4);

    else
        pipSymbol = imcrop(main, props(3).BoundingBox);
        [hog_4x4, vis4x4] = extractHOGFeatures(pipSymbol,'CellSize',[4 4]);
        hog_4x4 = hog_4x4(1,1:500);
       guessedSuit = getblacksuitSVM(hog_4x4);
    end

end

function prediction = getredsuitSVM(props)

%Red_Pip_Hog_Features contains the features matrix, labels cell array, and trained svm multiclass model SVMModel 
%svm model currently has 400 features
%passed properties must contain 400 features as well
load Red_Pip_Hog_Features
[label,score] = predict(SVMModel,props);
prediction = label;

end

function prediction = getblacksuitSVM(props)

%Black_Pip_Hog_Features contains the features matrix, labels cell array, and trained svm multiclass model SVMModel
%svm model currently has 500 features
%passed properties must contain the same number of features
load Black_Pip_Hog_Features
[label,score] = predict(SVMModel,props); %use the model to make a prediction based on based in properties
prediction = label;

end