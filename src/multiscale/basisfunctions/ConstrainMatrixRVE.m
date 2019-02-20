function [ Constrains ] = ConstrainMatrixRVE( adof,iMdof,anod,InputIndex,InputMultiscaleIndex,ivector)
%% Constrain Matrix

%ivector = 0 Discretization of a scalar parameter
%ivector = 1 Discretization of a vector

ibc_case=InputIndex.AnalIndex.MultiscaleIndex(1,2);

if ibc_case==1 %case Linear Boundary Conditions
    [ Constrains ] = ConstrainMatrixRVELinear(iMdof,anod,InputMultiscaleIndex,ivector);
elseif ibc_case==2 || ibc_case==42 %case Periodic Boundary Conditions
    [ Constrains ] = ConstrainMatrixRVEPeriodic(anod,InputMultiscaleIndex,ivector);
elseif ibc_case==3 || ibc_case==4 %case Oversampling Linear/Periodic Boundary Conditions (Temporary basis functions) 
    [ Constrains ] = ConstrainMatrixRVEOversamplingLinear( adof,InputMultiscaleIndex );
elseif ibc_case==32 %case Oversampling Linear Boundary Conditions (Final basis functions) 
    [ Constrains ] = ConstrainMatrixRVEOversamplingLinear2( adof,InputMultiscaleIndex );
end
end

