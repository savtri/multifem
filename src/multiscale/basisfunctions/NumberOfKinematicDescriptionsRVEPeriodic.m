function [ NumberOfKinematicDescriptions ] = NumberOfKinematicDescriptionsRVEPeriodic( InputMultiscaleIndex )
%
n=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes;
%
NumberOfKinematicDescriptions=2*(n(1)+2)+2*(n(4)+2);

end



