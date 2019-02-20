function [ InputMultiscaleIndex ] = FindMicrostrucrureIndexRVE( i,textRVE,InputIndex,InputMultiscaleIndex )
%% Find the Microstructure Index of RVE
idx = find(~cellfun('isempty',strfind(textRVE,'MICROSTRUCTURE_TYPE$'))) + 1;
LWm = cellfun(@(x) textscan(x,'%f'),textRVE(idx),'un',0);
MicrostructureIndex = cell2mat([LWm{:}]).';
InputMultiscaleIndex.MicrostructureIndex=MicrostructureIndex(i,1);
end

