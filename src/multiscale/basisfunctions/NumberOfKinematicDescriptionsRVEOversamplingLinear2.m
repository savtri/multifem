function [ NumberOfKinematicDescriptions ] = NumberOfKinematicDescriptionsRVEOversamplingLinear2(InputMultiscaleIndex )

n=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes;

NumberOfKinematicDescriptions=sum(n)+1;

end

