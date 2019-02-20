function [ AssembyMatrix] = AssembyMatrixRVELinear( adof,iMdof,inod,InputMultiscaleIndex,ivector)

switch ivector
    case 0
        nDofs=1;
    case 1
        nDofs=InputMultiscaleIndex.nDofsPerMacroNode;
end

iType=InputMultiscaleIndex.iType;
[aSurf, nSurf]=Get_Nodal_Surfaces(iType,inod);

h=0;
for imnod=1:size(InputMultiscaleIndex.Macro2InternalMapping,2)
    aMicroBoundedNode=InputMultiscaleIndex.Macro2InternalMapping(inod,imnod);
    if aMicroBoundedNode>0
        h=h+1;
        AssembyMatrix(h,1)=nDofs*(InputMultiscaleIndex.IndexXYMacroBoundaryNodes(inod,1)-1)+iMdof;                
        AssembyMatrix(h,2)=nDofs*(aMicroBoundedNode-1)+iMdof;
    end
end
%The last row holds the current macro node
AssembyMatrix(h+1,1)=nDofs*(InputMultiscaleIndex.IndexXYMacroBoundaryNodes(inod,1)-1)+iMdof;
AssembyMatrix(h+1,2)=0;

end

