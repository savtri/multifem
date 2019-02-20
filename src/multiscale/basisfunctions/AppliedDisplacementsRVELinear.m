function [ AppliedDisplacements,AssembyMatrix ] = AppliedDisplacementsRVELinear( i,iMnod, InputIndex,InputMultiscaleIndex,AssembyMatrixTMP )

nDim=InputIndex.nDim;

xyzM=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(:,2:nDim+1);    
%
iType          = InputMultiscaleIndex.iType;
[aSurf, nSurf] = Get_Nodal_Surfaces(iType,iMnod);
n              = InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes;
%
k=0;
for imnod=1:size(InputMultiscaleIndex.Macro2InternalMapping,2)
    aMicroBoundedNode=InputMultiscaleIndex.Macro2InternalMapping(iMnod,imnod);
    if aMicroBoundedNode>0        
        index = find(InputMultiscaleIndex.IndexXYMicroBoundaryNodes(:,1)==aMicroBoundedNode);
        xyzm  = InputMultiscaleIndex.IndexXYMicroBoundaryNodes(index,2:end);
        startX= zeros(1,nDim); 
        options = optimoptions('fsolve','Display','off');
        %Determine coordinates of node in the natural coordinate system        
        switch nDim
            case 2
                X=fsolve(@(x) fsolve_obj_AppliedDisplacements2DRVE(x,xyzm,xyzM),startX,options);
            case 3
                X=fsolve(@(x) fsolve_obj_AppliedDisplacements3DRVE(x,xyzm,xyzM),startX,options);
        end
        k=k+1;
        %Apply the corresponding isoparametric shape function 
        N = Get_Isoparametric_Shape_Function(iType, iMnod, X);
        AppliedDisplacementsTMP(k,1)=N;
    end
end

%Remove zero-displacements and corresponding kinematic constraints
k=0;
for idisp=1:size(AppliedDisplacementsTMP,1)
    if abs(AppliedDisplacementsTMP(idisp,1))>1.0e-5
        k=k+1;
        AppliedDisplacements(k,1)=AppliedDisplacementsTMP(idisp,1);
        AssembyMatrix(k,:)=AssembyMatrixTMP(idisp,:);
    end
end

AssembyMatrix(k+1,:)=AssembyMatrixTMP(end,:);
        



end
    
    
    

