function [ InputIndex,InputMultiscaleIndex ] = RedefinitionDueToOversamplingRVE( InputIndex,InputMultiscaleIndex )
%% Find the Macro nodes of RVE for oversampling
K=convhull(InputMultiscaleIndex.IndexXYNodesForOversampling(:,2),InputMultiscaleIndex.IndexXYNodesForOversampling(:,3),'simplify',true);
InputMultiscaleIndex.IndexXYMacroBoundaryNodesForOversampling=zeros(4,3);
InputMultiscaleIndex.IndexXYMacroBoundaryNodesForOversampling(:,1)=InputMultiscaleIndex.IndexXYNodesForOversampling(K(1:4),1);
InputMultiscaleIndex.IndexXYMacroBoundaryNodesForOversampling(:,2)=InputMultiscaleIndex.IndexXYNodesForOversampling(K(1:4),2);
InputMultiscaleIndex.IndexXYMacroBoundaryNodesForOversampling(:,3)=InputMultiscaleIndex.IndexXYNodesForOversampling(K(1:4),3);
%% Find the micro boundary nodes of RVE for oversampling
InputMultiscaleIndex.IndexXYMicroBoundaryNodesForOversampling(:,1)=InputMultiscaleIndex.BoundedNodesForOversampling;
InputMultiscaleIndex.NumberOfBoundedNodesRVEForOversampling=InputMultiscaleIndex.NumberOfBoundedNodesRVEForOversampling;
%% Assign the coords of micro boundary nodes of RVE for oversampling
for i=1:InputMultiscaleIndex.NumberOfBoundedNodesRVEForOversampling
    for j=1:InputMultiscaleIndex.NumberofNodesForOversampling
        if InputMultiscaleIndex.IndexXYMicroBoundaryNodesForOversampling(i,1)==InputMultiscaleIndex.IndexXYNodesForOversampling(j,1)
            InputMultiscaleIndex.IndexXYMicroBoundaryNodesForOversampling(i,2)=InputMultiscaleIndex.IndexXYNodesForOversampling(j,2);
            InputMultiscaleIndex.IndexXYMicroBoundaryNodesForOversampling(i,3)=InputMultiscaleIndex.IndexXYNodesForOversampling(j,3);
        end
	end
end
%% Find the Number of micro boundary internal nodes of RVE in each surface 1,2,3,4 for oversampling
NumberOfMicroBoundaryInternalNodes=zeros(4,1);
for i=1:InputMultiscaleIndex.NumberOfCoarseMacroNodes
    a1(i,1)=find(InputMultiscaleIndex.IndexXYMacroBoundaryNodesForOversampling(i,1)==InputMultiscaleIndex.BoundedNodesForOversampling(:,1));
end
NumberOfMicroBoundaryInternalNodes(1,1)=a1(2,1)-a1(1,1)-1;
NumberOfMicroBoundaryInternalNodes(2,1)=a1(3,1)-a1(2,1)-1;
NumberOfMicroBoundaryInternalNodes(3,1)=a1(4,1)-a1(3,1)-1;
NumberOfMicroBoundaryInternalNodes(4,1)=InputMultiscaleIndex.NumberOfBoundedNodesRVEForOversampling-sum(NumberOfMicroBoundaryInternalNodes,1)-4;
InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodesForOversampling=NumberOfMicroBoundaryInternalNodes;
end

