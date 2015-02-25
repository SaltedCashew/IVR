function prediction = getblacksuitSVM(props)

%Black_Pip_Hog_Features contains the features matrix, labels cell array, and trained svm multiclass model SVMModel
%svm model currently has 500 features
%passed properties must contain the same number of features
load Black_Pip_Hog_Features
[label,score] = predict(SVMModel,props); %use the model to make a prediction based on based in properties
prediction = label;

end