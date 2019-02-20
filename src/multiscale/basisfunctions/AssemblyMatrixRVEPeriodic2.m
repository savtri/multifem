function [ AssemblyMatrix ] = AssemblyMatrixRVEPeriodic2(InputMultiscaleIndex,ivector)



thePairs=InputMultiscaleIndex.PeriodicPairs;

switch ivector
    case 0
        nDofs=1;
    case 1
        nDofs=InputMultiscaleIndex.nDofsPerMacroNode;
end

h=0;
for iPair=1:size(thePairs,1)
    for iDof=1:nDofs
        h=h+1;
        AssemblyMatrix(h,1)=nDofs*(thePairs(iPair,1)-1)+iDof; 
        AssemblyMatrix(h,2)=nDofs*(thePairs(iPair,2)-1)+iDof; 
    end    
end