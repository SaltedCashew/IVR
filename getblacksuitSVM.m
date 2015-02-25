function prediction = getblacksuitSVM(props)

%Black_Pip_Hog_Features contains the features matrix, labels cell array, and trained svm multiclass model SVMModel  
load Black_Pip_Hog_Features
[label,score] = predict(SVMModel,props);
prediction = label;

end