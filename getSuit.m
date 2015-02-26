function guessedSuit = getSuit(guessedColor, pipSymbol)
% based on color of card, use hog features and multiclass svm to determine
% suit

    [hog_4x4, vis4x4] = extractHOGFeatures(pipSymbol,'CellSize',[4 4]); %vis4x4 kept for debugging
    hogs = hog_4x4(1,1:200); %both color svms require 200 features
    if (strcmp(guessedColor, 'red') == 1)
        guessedSuit = getredsuitSVM(hogs);
     else
       guessedSuit = getblacksuitSVM(hogs);
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
[prediction,~] = predict(SVMModel,props); 

end

function prediction = getblacksuitSVM(props)

%Black_Pip_Hog_Features contains the features matrix, reduced features
%and labels cell array, and trained svm multiclass model SVMModel
%features matrix contains 500 features (HOGS)
%reducedfeatures matrix contains 200 features
%svm model is trained with the reducedfeatures matrix, and the passed
%properties must contain 200 features to match
load Black_Pip_Hog_Features
[prediction,~] = predict(SVMModel,props); %use the model to make a prediction based on based in properties

end