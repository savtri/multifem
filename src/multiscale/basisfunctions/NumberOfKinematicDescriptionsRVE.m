function [ NumberOfKinematicDescriptions ] = NumberOfKinematicDescriptionsRVE(aNod,InputIndex,InputMultiscaleIndex )
%% Find the number of kinematic constrains

ibc_case=InputIndex.AnalIndex.MultiscaleIndex(1,2);

if ibc_case ==1 || ibc_case==3 || ibc_case==4  %case Linear Boundary Conditions
    [ NumberOfKinematicDescriptions ] = NumberOfKinematicDescriptionsRVELinear(aNod,InputMultiscaleIndex );

elseif ibc_case==2 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==42 %case Periodic Boundary Conditions
    [ NumberOfKinematicDescriptions ] = NumberOfKinematicDescriptionsRVEPeriodic( InputMultiscaleIndex );    

elseif ibc_case==32 %case Oversampling Linear Boundary Conditions (Final basis functions)
    [ NumberOfKinematicDescriptions ] = NumberOfKinematicDescriptionsRVEOversamplingLinear2(InputMultiscaleIndex);    

end

end

