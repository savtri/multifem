function [ NumberOfKinematicDescriptions ] = NumberOfKinematicDescriptionsRVELinear( aNod,InputMultiscaleIndex )
%
n=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes;
%
[aSurf,nSurf]=Get_Nodal_Surfaces(InputMultiscaleIndex.iType,aNod);

NumberOfKinematicDescriptions=1;
% for iSurf=1:nSurf       
%    NumberOfKinematicDescriptions=NumberOfKinematicDescriptions+n(aSurf(iSurf));
% end

for inod=1:size(InputMultiscaleIndex.Macro2InternalMapping,2)
    if InputMultiscaleIndex.Macro2InternalMapping(aNod,inod)>0
        NumberOfKinematicDescriptions=NumberOfKinematicDescriptions+1;
    end
end

   
end
