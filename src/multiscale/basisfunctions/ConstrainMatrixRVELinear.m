function [ Constrains ] = ConstrainMatrixRVELinear(iMdof,anod,InputMultiscaleIndex,ivector)

%icase=0 -- Scalar Field
%icase=1 -- Vector Field
switch ivector
    case 0
        nDofs=1;
        Constrains=ones(InputMultiscaleIndex.NumberofNodes,1);
    case 1
        nDofs=InputMultiscaleIndex.nDofsPerMacroNode;
        Constrains=ones(InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,1);        
end
    
iType=InputMultiscaleIndex.iType;

%First constraint all degrees of freedom on the surfaces opposite to the node
[theOpSurf,nOpSurf]=Get_Op_Surf(iType,anod);
iconstraint=0;
for iSurf=1:nOpSurf 
    for imnode=1:InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(theOpSurf(iSurf),1)        
        abNode=InputMultiscaleIndex.MicroBoundaryInternalNodes(theOpSurf(iSurf),imnode);
        for idof=1:nDofs
            iconstraint=iconstraint+1;
            c(iconstraint,1)=nDofs*(abNode-1)+idof;
        end
    end
end
%Next, constraint all degrees of freedom on the rest of the surfaces which
%are perpendicular to the current dof
if nDofs>1
    [aSurf, nSurf]=Get_Nodal_Surfaces(iType,anod);
    for iSurf=1:nSurf
        for imnode=1:InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(aSurf(iSurf),1)
            for idof=1:nDofs
               if idof~=iMdof
                iconstraint=iconstraint+1;
                abNode=InputMultiscaleIndex.MicroBoundaryInternalNodes(aSurf(iSurf),imnode);            
                c(iconstraint,1)=nDofs*(abNode-1)+idof;
               end
            end
        end
    end
end
%Constraint all other MacroNodes in the Both Directions
c2=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(anod,1); 
for j=1:InputMultiscaleIndex.NumberOfCoarseMacroNodes
    c1=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(j,1);
    if c1~=c2    
        for idof=1:nDofs        
            iconstraint=iconstraint+1;
            c(iconstraint,1)=nDofs*(InputMultiscaleIndex.IndexXYMacroBoundaryNodes(j,1)-1)+idof;        
        end      
    end
end
%Constraint Current node in Perpendicular directions
if nDofs>1
    for idof=1:nDofs
       if idof~=iMdof
        iconstraint=iconstraint+1;
        c(iconstraint,1)=nDofs*(c2-1)+idof;        
       end
    end
end
for j=1:size(c,1)
    Constrains(c(j,1))=0;
end

        
end

