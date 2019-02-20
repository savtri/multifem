function [ InputIndex ] = ReadBoundaryConditions( text,InputIndex )
%% Find the total number of boundary conditions (in Coarse nodes)
%Find the start index
startIdx = find(~cellfun('isempty',strfind(text,'$IDB')));
%Find the end index
endIdx=InputIndex.Dollar(find(InputIndex.Dollar==startIdx)+1,1);
%Re-Assign start/end index 
startIdx=startIdx+1;
endIdx=endIdx-1;
%Find the total number of boundary conditions
InputIndex.Constrains.NumberOfNodalDispConst=endIdx-startIdx+1;

%% Read the nodal constrains (in Coarse nodes)
LWm=cellfun(@(x) textscan(x,'%f'),text(startIdx:endIdx),'un',0);
InputIndex.Constrains.IndividualDispConstIndex=cell2mat([LWm{:}]).';
end