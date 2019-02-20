function BasisFunctionCheck( N,InputMultiscaleIndex,ivector)

% Check Basis Functions---------------------------------------------------%
% Shape Function                : N                                       %
% Number of Coarse Macro Nodes  : MNod                                    %
% Number of Coarse micro Nodes  : miNod                                   %
%-------------------------------------------------------------------------%

NumberOfCoarseMacroNodes=InputMultiscaleIndex.NumberOfCoarseMacroNodes;

switch ivector
    case 0 %scalar quantity
        nDofs=1;
        nDofsPerNode=1;
        nDirs=1;        
    case 1 %vectorial quantity
        nDofs=InputMultiscaleIndex.DegreeOfFreedomCoarseMicro;
        nDofsPerNode=InputMultiscaleIndex.nDofsPerMacroNode;        
end



    
SumN=zeros(nDofsPerNode*NumberOfCoarseMacroNodes,nDofsPerNode);                  
for idir=1:nDofsPerNode            
    for inod1=1:NumberOfCoarseMacroNodes
        anode1=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(inod1,1);    
      for inod2=1:NumberOfCoarseMacroNodes
            anode2=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(inod2,1);                          
            SumN(nDofsPerNode*(inod1-1)+idir,idir)=SumN(nDofsPerNode*(inod1-1)+idir,idir)+N(nDofsPerNode*(anode1-1)+idir,nDofsPerNode*(inod2-1)+idir);        
      end
    end
end                 

    

Print_Check(SumN,InputMultiscaleIndex.iType,nDofs,ivector)



end 

