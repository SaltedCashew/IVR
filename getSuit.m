function guessedSuit = getSuit(guessedColor, pipSymbol)
% based on color of card, use 2 class Bayes classifier to determine suit
if (strcmp(guessedColor, 'red') == 1)
    
    [hog_4x4, vis4x4] = extractHOGFeatures(pipSymbol,'CellSize',[4 4]);
    hog_4x4 = hog_4x4(1,1:200);
    guessedSuit = getredsuitSVM(hog_4x4);
    
else
    [hog_4x4, vis4x4] = extractHOGFeatures(pipSymbol,'CellSize',[4 4]);
    hog_4x4 = hog_4x4(1,1:200);
    guessedSuit = getblacksuitSVM(hog_4x4);
end

end

function prediction = getredsuitSVM(props)

%Red_Pip_Hog_Features contains the features matrix, reduced features
%and labels cell array, and trained svm multiclass model SVMModel
%features matrix contains 400 features (HOGS)
%reducedfeatures matrix contains 200 features
%svm model is trained with the reducedfeatures matrix, and the passed
%properties must contain 200 features to match
load Red_Pip_Hog_Features
[label,score] = predict(SVMModel,props);
prediction = label;

end

function prediction = getblacksuitSVM(props)

%Black_Pip_Hog_Features contains the features matrix, reduced features
%and labels cell array, and trained svm multiclass model SVMModel
%features matrix contains 500 features (HOGS)
%reducedfeatures matrix contains 200 features
%svm model is trained with the reducedfeatures matrix, and the passed
%properties must contain 200 features to match
load Black_Pip_Hog_Features
[label,score] = predict(SVMModel,props); %use the model to make a prediction based on based in properties
prediction = label;

end