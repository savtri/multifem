function [ InputMultiscaleIndex ] = ReadBoundaryNodesRVE( i,textRVE,InputIndex,InputMultiscaleIndex )
%% Find the Number of Bounded Nodes of RVE
%Find the start index
startIdx = find(~cellfun('isempty',strfind(textRVE,'Bounded Nodes')));
%Find the end index
endIdx=InputMultiscaleIndex.Dollar2(find(InputMultiscaleIndex.Dollar2>startIdx(i,1),1),1);
%Re-Assign start/end index 
startIdx=startIdx(i,1)+1;
endIdx=endIdx-1;
%Find the Number of Bounded Nodes of RVE
InputMultiscaleIndex.NumberOfBoundedNodesRVE=endIdx-startIdx+1;

%% Read the Bounded Nodes of RVE
InputMultiscaleIndex.BoundedNodes=cellfun(@(x) textscan(x,'%f'),textRVE(startIdx:endIdx),'un',0);
InputMultiscaleIndex.BoundedNodes=cell2mat([InputMultiscaleIndex.BoundedNodes{:}]).';

%% (only for Oversampling Linear and Periodic)
if InputIndex.AnalIndex.MultiscaleIndex(1,2)==3 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==4
    %Find the Number of Bounded Nodes of RVE
    %Find the start index
    startIdx = find(~cellfun('isempty',strfind(textRVE,'Bounded_Nodes_OVERSAMPLING')));
    %Find the end index
    endIdx=InputMultiscaleIndex.Dollar2(find(InputMultiscaleIndex.Dollar2>startIdx(i,1),1),1);
    %Re-Assign start/end index 
    startIdx=startIdx(i,1)+1;
    endIdx=endIdx-1;
    %Find the Number of Bounded Nodes of RVE
    InputMultiscaleIndex.NumberOfBoundedNodesRVEForOversampling=endIdx-startIdx+1;   
    
    %Read the Bounded Nodes of RVE
    InputMultiscaleIndex.BoundedNodesForOversampling=cellfun(@(x) textscan(x,'%f'),textRVE(startIdx:endIdx),'un',0);
    InputMultiscaleIndex.BoundedNodesForOversampling=cell2mat([InputMultiscaleIndex.BoundedNodesForOversampling{:}]).';

    %Read bounded nodes in glodal axis for oversampling
    %Find the start index
    startIdx = find(~cellfun('isempty',strfind(textRVE,'Bounded_Nodes_GLOBAL_OVERSAMPLING')));
    %Find the end index
    endIdx=InputMultiscaleIndex.Dollar2(find(InputMultiscaleIndex.Dollar2>startIdx(i,1),1),1);
    %Re-Assign start/end index 
    startIdx=startIdx(i,1)+1;
    endIdx=endIdx-1;
    
    InputMultiscaleIndex.BoundedNodesGlobalForOversampling=cellfun(@(x) textscan(x,'%f'),textRVE(startIdx:endIdx),'un',0);
    InputMultiscaleIndex.BoundedNodesGlobalForOversampling=cell2mat([InputMultiscaleIndex.BoundedNodesGlobalForOversampling{:}]).';
end
end

