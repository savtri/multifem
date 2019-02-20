function [ InputIndex] = ReadConnectivityOfElements( text,InputIndex )
%% Find the Number of Coarse Elements
%Find the start index
startIdx = find(~cellfun('isempty',strfind(text,'$$ELEMENT')));
%Find the end index
endIdx=InputIndex.Dollar2(find(InputIndex.Dollar2==startIdx)+1,1);
%Re-Assign start/end index 
startIdx=startIdx+1;
endIdx=endIdx-1;
%Find the Number of Elements
InputIndex.NumberOfElements=endIdx-startIdx+1;

%% Read the Coarse elements connectivity
InputIndex.Elements=cellfun(@(x) textscan(x,'%f'),text(startIdx:endIdx),'un',0);
InputIndex.Elements=cell2mat([InputIndex.Elements{:}]).';
%Store the total number of different coarse element types (last column of
%the element matrix
InputIndex.NumberOfMicrostructures=max(InputIndex.Elements(:,end));

end

