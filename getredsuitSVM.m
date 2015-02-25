function prediction = getredsuitSVM(props)

%Red_Pip_Hog_Features contains the features matrix, labels cell array, and trained svm multiclass model SVMModel 
%svm model currently has 400 features
%passed properties must contain 400 features as well
load Red_Pip_Hog_Features
[label,score] = predict(SVMModel,props);
prediction = label;

end
