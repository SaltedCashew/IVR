function pipbool = findPipRegions(props)


load region_Data_Black
SVMModel = fitcsvm(regionData,regionTargets,'KernelFunction','rbf','Standardize',true,'ClassNames',{'false','true'});

[label,score] = predict(SVMModel,props);

pipbool = label;


end

 
 