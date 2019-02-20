function [ InputIndex ] = ReadOutputIndexes( text,InputIndex )
%% Read if you want Coarse properties in output folder
idx = find(~cellfun('isempty',strfind(text,'$COARSE_PROPERTIES'))) + 1;
LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
CoarsePropertiesIndex(1,:)=LWm;
InputIndex.OutputIndex.CoarsePropertiesIndex=CoarsePropertiesIndex;

%% Read if you want RVE properties in output folder
if InputIndex.AnalIndex.MultiscaleIndex(1,1)==1; %case Multiscale Analysis 
    idx = find(~cellfun('isempty',strfind(text,'$RVE_PROPERTIES'))) + 1;
    LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
    LWm = cell2mat([LWm{:}]).';
    RVEPropertiesIndex(1,:)=LWm;
    InputIndex.OutputIndex.RVEPropertiesIndex=RVEPropertiesIndex;
end
end
