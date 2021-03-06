function [ InputIndex ] = ReadCoordinatesOfNodes( text,InputIndex )
%% Find the total number of nodes (Coarse Elements)
%Find the start index
startIdx = find(~cellfun('isempty',strfind(text,'$$NODE')));
%Find the end index
endIdx=InputIndex.Dollar2(find(InputIndex.Dollar2==startIdx)+1,1);
%Re-Assign start/end index 
startIdx=startIdx+1;
endIdx=endIdx-1;
%Find the total number of nodes
InputIndex.NumberOfNodes=endIdx-startIdx+1;
%Find the total degree of freedom
InputIndex.DegreeOfFreedom=InputIndex.nDim*InputIndex.NumberOfNodes;

%% Read the nodal coordinates (Coarse Elements)
InputIndex.IndexXYNodes=cellfun(@(x) textscan(x,'%f'),text(startIdx:endIdx),'un',0);
InputIndex.IndexXYNodes=cell2mat([InputIndex.IndexXYNodes{:}]).';
end

