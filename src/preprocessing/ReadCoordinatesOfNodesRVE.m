function [ InputMultiscaleIndex ] = ReadCoordinatesOfNodesRVE( i,textRVE,InputIndex,InputMultiscaleIndex )
%% Find the total number of nodes (RVE)
%Find the start index
startIdx = find(~cellfun('isempty',strfind(textRVE,'POINT$')));
%Find the end index
endIdx = find(~cellfun('isempty',strfind(textRVE,'ELEMENT$')));
%Re-Assign start/end index 
startIdx=startIdx(i,1)+1;
endIdx=endIdx(i,1)-1;
%Find the total number of nodes
InputMultiscaleIndex.NumberofNodes=endIdx-startIdx+1;

%% Read the nodal coordinates (RVE)
InputMultiscaleIndex.IndexXYNodes=cellfun(@(x) textscan(x,'%f'),textRVE(startIdx:endIdx),'un',0);
InputMultiscaleIndex.IndexXYNodes=cell2mat([InputMultiscaleIndex.IndexXYNodes{:}]).';


%% (only for Oversampling Linear and Periodic)
if InputIndex.AnalIndex.MultiscaleIndex(1,2)==3 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==4
    %Find the start index
    startIdx = find(~cellfun('isempty',strfind(textRVE,'POINT_OVERSAMPLING$')));
    %Find the end index
    endIdx = find(~cellfun('isempty',strfind(textRVE,'ELEMENT_OVERSAMPLING$')));
    %Re-Assign start/end index 
    startIdx=startIdx(i,1)+1;
    endIdx=endIdx(i,1)-1;
    %Find the total number of nodes
    InputMultiscaleIndex.NumberofNodesForOversampling=endIdx-startIdx+1;

    %% Read the nodal coordinates (RVE)
    InputMultiscaleIndex.IndexXYNodesForOversampling=cellfun(@(x) textscan(x,'%f'),textRVE(startIdx:endIdx),'un',0);
    InputMultiscaleIndex.IndexXYNodesForOversampling=cell2mat([InputMultiscaleIndex.IndexXYNodesForOversampling{:}]).';
end
end

