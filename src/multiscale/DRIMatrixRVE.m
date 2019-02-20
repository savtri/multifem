function [ Rgen ] = DRIMatrixRVE( N,InputIndex,InputMultiscaleIndex )
% Make R Matrices

nDofPerNode= InputMultiscaleIndex.nDofsPerMacroNode          ; %dofs p Node
CMdof      = InputMultiscaleIndex.DegreeOfFreedomCoarseMacro ;
Cmidof     = InputMultiscaleIndex.DegreeOfFreedomCoarseMicro ;
CMnod      = InputMultiscaleIndex.NumberOfCoarseMacroNodes   ;
j=1;
k=1;


    
for i=1:InputMultiscaleIndex.NumberofNodes                        
    index1=nDofPerNode*(i-1)+1;
    index2=nDofPerNode*(i-1)+nDofPerNode;        
    %
    Rgen{i}=N(index1:index2,:);
    %        
end
    

    
end

