function [ InputIndex ] = ReadLoads( text,InputIndex )
%% Find the number of Nodal Loads (in Coarse nodes)
%Find the start index
startIdx = find(~cellfun('isempty',strfind(text,'$NODAL')));
%Find the end index
if ~isempty(startIdx)
    InputIndex.Loads.iConc=1;
    endIdx=InputIndex.Dollar(find(InputIndex.Dollar==startIdx)+1,1);
    %Re-Assign start/end index 
    startIdx=startIdx+1;
    endIdx=endIdx-1;
    %Find the total number of nodal loads
    InputIndex.Loads.NumberOfIndividualLoads = endIdx-startIdx+1;


    %% Read the nodal loads (in Coarse nodes)
    LWm=cellfun(@(x) textscan(x,'%f'),text(startIdx:endIdx),'un',0);
    InputIndex.Loads.IndividualLoadIndex=cell2mat([LWm{:}]).';
else
    InputIndex.Loads.iConc=0;
end

%%-------------------------------------------------------------------------
% Gravity 
idx = find(~cellfun('isempty',strfind(text,'$GRAVITY'))) + 1;
if ~isempty(idx)
    InputIndex.Loads.Grav=1;
    LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
    LWm = cell2mat([LWm{:}]).';
    Gravity(1,:) = LWm ;
else
    InputIndex.Loads.Grav=0;
    InputIndex.Loads.Gravity = 0.0;
end


end