function [ InputIndex ] = ReadDrawIndexes( text,InputIndex )
%% Read if you want draw Coarse initial structure in draw folder
idx = find(~cellfun('isempty',strfind(text,'$DRAW_INITIAL_STRUCTURE'))) + 1;
LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
DrawInitialStructureCoarseIndex(1,:)=LWm;
InputIndex.DrawIndex.DrawInitialStructureCoarseIndex=DrawInitialStructureCoarseIndex;

%% Read if you want draw initial structure of RVE in draw folder
idx = find(~cellfun('isempty',strfind(text,'$DRAW_INITIAL_RVE'))) + 1;
LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
DrawInitialStructureRVEIndex(1,:)=LWm;
InputIndex.DrawIndex.DrawInitialStructureRVEIndex=DrawInitialStructureRVEIndex;

%% Read if you want draw basis function of RVE in draw folder
idx = find(~cellfun('isempty',strfind(text,'$DRAW_BASIS_FUNCTION_RVE'))) + 1;
LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
DrawBasisFunctionStructureRVEIndex(1,:)=LWm;
InputIndex.DrawIndex.DrawBasisFunctionStructureRVEIndex=DrawBasisFunctionStructureRVEIndex;

%% Read Graphs Parameters 
[ InputIndex ] = ReadDrawGraphsIndexesFEM( text,InputIndex );

%% Read Field Parameters
[ InputIndex ] = ReadDrawFieldIndexesFEM( text,InputIndex );

end