function prediction = getredsuitSVM(props)

load Red_Pip_Hog_Features
SVMModel = fitcecoc(features,labels);

[label,score] = predict(SVMModel,props);

prediction = label;
end
