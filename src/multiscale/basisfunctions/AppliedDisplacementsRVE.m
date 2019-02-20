function [ AppliedDisplacements,AssembyMatrix] = AppliedDisplacementsRVE( adof,iMdof, iMnod, InputIndex,InputMultiscaleIndex,AssembyMatrixTMP,ivector,iPF)
%% Applied Displacements in each surface

ibc_case=InputIndex.AnalIndex.MultiscaleIndex(1,2);

if ibc_case==1 || ibc_case==3 || ibc_case==4 %case Linear Boundary Conditions
    [ AppliedDisplacements,AssembyMatrix] = AppliedDisplacementsRVELinear( adof,iMnod, InputIndex,InputMultiscaleIndex,AssembyMatrixTMP);
elseif ibc_case==2 %case Periodic Boundary Conditions
%     [ AppliedDisplacements1 ] = AppliedDisplacementsRVEPeriodic( adof,InputIndex,InputMultiscaleIndex );
    AssembyMatrix=AssembyMatrixTMP;
    [ AppliedDisplacements ] = AppliedDisplacementsRVEPeriodic2( iMdof,iMnod,InputIndex,InputMultiscaleIndex,ivector,iPF);
elseif ibc_case==32 %case Oversampling Linear Boundary Conditions (Final basis functions) 
    [ AppliedDisplacements ] = AppliedDisplacementsRVEOversamplingLinear2( adof,InputIndex,InputMultiscaleIndex );    
elseif ibc_case==42 %case Oversampling Periodic Boundary Conditions (Final basis functions) 
    [ AppliedDisplacements ] = AppliedDisplacementsRVEOversamplingPeriodic2( adof,InputIndex,InputMultiscaleIndex );
end
end

