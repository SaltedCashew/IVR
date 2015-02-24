function prediction = getblacksuitSVM(props)

%black_suit_data contains the features matrix (suitprops_black) and the
%target vector (suittargets_black). suittargets_black is a cell array of
%strings 'spade' and 'club'
load black_suit_data
SVMModel = fitcsvm(suitprops_black,suittargets_black,'KernelFunction','rbf','Standardize',true,'ClassNames',{'spade','club'});

[label,score] = predict(SVMModel,props);

prediction = label;
end