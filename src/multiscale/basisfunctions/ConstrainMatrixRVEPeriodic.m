function [ Constrains ] = ConstrainMatrixRVEPeriodic(anod,InputMultiscaleIndex,ivector)
%ivector=0 -- Scalar Field
%ivector=1 -- Vector Field
switch ivector
    case 0
        nDofs=1;
        Constrains=ones(InputMultiscaleIndex.NumberofNodes,1);
    case 1
        nDofs=InputMultiscaleIndex.nDofsPerMacroNode;
        Constrains=ones(InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,1);        
end
    
iType=InputMultiscaleIndex.iType;

%First constraint all degrees of freedom on the opposite nodes
[theOpNodes,nNodes]=Get_Op_Nodes(iType,anod);
iconstraint=0;
for iNode=1:nNodes 
    aNode=theOpNodes(iNode,1);
    aMnode=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(aNode,1);
        for idof=1:nDofs
            iconstraint=iconstraint+1;
            c(iconstraint,1)=nDofs*(aMnode-1)+idof;
        end
end
    
Constrains(c,1)=0;

end    
    

    
    


