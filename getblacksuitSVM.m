function prediction = getblacksuitSVM(props)

load Black_Pip_Hog_Features
SVMModel = fitcecoc(features,labels);

[label,score] = predict(SVMModel,props);

prediction = label;
end