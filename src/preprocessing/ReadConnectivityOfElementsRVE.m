function [ InputMultiscaleIndex ] = ReadConnectivityOfElementsRVE( i,textRVE,InputIndex,InputMultiscaleIndex )
%% Find the Number of Finite Elements in RVE 
%Find the start index
startIdx = find(~cellfun('isempty',strfind(textRVE,'ELEMENT$')));
%Find the end index
endIdx= find(~cellfun('isempty',strfind(textRVE,'Bounded Nodes')));
%Re-Assign start/end index 
startIdx=startIdx(i,1)+1;
endIdx=endIdx(i,1)-1;
%Find the Number of Elements in RVE
InputMultiscaleIndex.NumberOfElements=endIdx-startIdx+1;

%% Read the connectivity of Finite elements in RVE
InputMultiscaleIndex.Elements=cellfun(@(x) textscan(x,'%f'),textRVE(startIdx:endIdx),'un',0);
InputMultiscaleIndex.Elements=cell2mat([InputMultiscaleIndex.Elements{:}]).';
%Read the different kind of Section and Materials
InputMultiscaleIndex.NumberOfDifferentSections=max(InputMultiscaleIndex.Elements(:,end));

%% (only for Oversampling Linear and Periodic)
if InputIndex.AnalIndex.MultiscaleIndex(1,2)==3 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==4
    %Find the Number of Finite Elements in RVE 
    %Find the start index
    startIdx = find(~cellfun('isempty',strfind(textRVE,'ELEMENT_OVERSAMPLING$')));
    %Find the end index
    endIdx= find(~cellfun('isempty',strfind(textRVE,'Bounded_Nodes_OVERSAMPLING')));
    %Re-Assign start/end index 
    startIdx=startIdx(i,1)+1;
    endIdx=endIdx(i,1)-1;
    %Find the Number of Elements in RVE
    InputMultiscaleIndex.NumberOfElementsForOversampling=endIdx-startIdx+1;
    
    %Read the connectivity of Finite elements in RVE
    InputMultiscaleIndex.ElementsForOversampling=cellfun(@(x) textscan(x,'%f'),textRVE(startIdx:endIdx),'un',0);
    InputMultiscaleIndex.ElementsForOversampling=cell2mat([InputMultiscaleIndex.ElementsForOversampling{:}]).';
    %Read the different kind of Section and Materials
    InputMultiscaleIndex.NumberOfDifferentSectionsForOversampling=max(InputMultiscaleIndex.ElementsForOversampling(:,end));
end

end

