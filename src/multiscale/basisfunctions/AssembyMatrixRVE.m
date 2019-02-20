function [ AssembyMatrix] = AssembyMatrixRVE( adof,iMdof, anod, NumberOfKinematicDescriptions,InputIndex,InputMultiscaleIndex,ivector)

%ivector = 0 Discretization of a scalar parameter
%ivector = 1 Discretization of a vector

%% Define the Assembly Matrix of Degree of Freedom

ibc_case=InputIndex.AnalIndex.MultiscaleIndex(1,2);

if ibc_case==1 || ibc_case==3 || ibc_case==4 %case Linear Boundary Conditions
    [ AssembyMatrix] = AssembyMatrixRVELinear( adof,iMdof, anod,InputMultiscaleIndex,ivector);    
elseif ibc_case==2 || ibc_case==42  %case Periodic Boundary Conditions
%     [ AssembyMatrix1 ] = AssembyMatrixRVEPeriodic( adof,NumberOfKinematicDescriptions,InputMultiscaleIndex );
    [ AssembyMatrix ] = AssemblyMatrixRVEPeriodic2(InputMultiscaleIndex,ivector);
elseif ibc_case==32 %case Oversampling Linear Boundary Conditions (Final basis functions) 
    [ AssembyMatrix ] = AssembyMatrixRVEOversamplingLinear2( adof,NumberOfKinematicDescriptions,InputIndex,InputMultiscaleIndex );
end

end

