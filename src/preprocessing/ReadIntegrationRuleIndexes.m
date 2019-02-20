function [ InputIndex ] = ReadIntegrationRuleIndexes( text,InputIndex )
% Read the Gauss integration rule index
idx = find(~cellfun('isempty',strfind(text,'$$GAUSS_RULE'))) + 1;
LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
NumberOfIntegPoints(1,:)=LWm; 

InputIndex.NumberOfIntegPoints = NumberOfIntegPoints; %Assign Number of Integration Points (in each Finite Element (only in FEM)

end

