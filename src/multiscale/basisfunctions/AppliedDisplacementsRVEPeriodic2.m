function [ AppliedDisplacements ] = AppliedDisplacementsRVEPeriodic2( iMdof,iMnod,InputIndex,InputMultiscaleIndex,ivector,iPF)

nDim=InputIndex.nDim;

switch ivector
    case 0
        nDofs=1;
    case 1
        nDofs=InputMultiscaleIndex.nDofsPerMacroNode;
end

xyzM=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(:,2:nDim+1);    
%
iType          = InputMultiscaleIndex.iType;
%
k=0;
nPairs=size(InputMultiscaleIndex.PeriodicPairs,1);
AppliedDisplacements=zeros(nDofs*nPairs,1);
for iPair=1:nPairs
    aNode1=InputMultiscaleIndex.PeriodicPairs(iPair,1);
    aNode2=InputMultiscaleIndex.PeriodicPairs(iPair,2);
    %
    index1 = find(InputMultiscaleIndex.IndexXYMicroBoundaryNodes(:,1)==aNode1);
    index2 = find(InputMultiscaleIndex.IndexXYMicroBoundaryNodes(:,1)==aNode2);
    %
    xyzm1  = InputMultiscaleIndex.IndexXYMicroBoundaryNodes(index1,2:end);
    startX= zeros(1,nDim); 
    options = optimoptions('fsolve','Display','off');
    %Determine coordinates of node in the natural coordinate system            
    switch nDim
        case 2
            X1=fsolve(@(x) fsolve_obj_AppliedDisplacements2DRVE(x,xyzm1,xyzM),startX,options);
        case 3
            X1=fsolve(@(x) fsolve_obj_AppliedDisplacements3DRVE(x,xyzm1,xyzM),startX,options);
    end
    xyzm2  = InputMultiscaleIndex.IndexXYMicroBoundaryNodes(index2,2:end);
    %Determine coordinates of node in the natural coordinate system        
    switch nDim
        case 2
            X2=fsolve(@(x) fsolve_obj_AppliedDisplacements2DRVE(x,xyzm2,xyzM),startX,options);
        case 3
            X2=fsolve(@(x) fsolve_obj_AppliedDisplacements3DRVE(x,xyzm2,xyzM),startX,options);
    end
    %
    k=k+1;
    %Apply the corresponding isoparametric shape function 
    N1 = Get_Isoparametric_Shape_Function(iType, iMnod, X1);
    N2 = Get_Isoparametric_Shape_Function(iType, iMnod, X2);
    
    if iPF==1  
        AppliedDisplacements(nDofs*(iPair-1)+iMdof,1)=N1-N2;      
    else
         AppliedDisplacements(nDofs*(iPair-1)+iMdof,1)=N1-N2;      
    end
    
    
    
end




end
