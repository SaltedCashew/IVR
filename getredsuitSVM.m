function prediction = getredsuitSVM(props)

%black_suit_data contains the features matrix (suitprops_red) and the
%target vector (suittargets_black). suittargets_red is a cell array of
%strings 'heart' and 'diamond'
load red_suit_data
SVMModel = fitcsvm(suitprops_red,suittargets_red,'KernelFunction','rbf','Standardize',true,'ClassNames',{'heart','diamond'});

[label,score] = predict(SVMModel,props);

prediction = label;
end
