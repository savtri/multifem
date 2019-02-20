function [ C_Lagrange ] = C_LagrangeMatrixRVE(NumberOfKinematicDescriptions,AssembyMatrix,AppliedDisplacements,InputIndex,InputMultiscaleIndex,ivector)

icase1=InputIndex.AnalIndex.MultiscaleIndex(1,2)==1 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==3 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==4 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==32;
icase2=InputIndex.AnalIndex.MultiscaleIndex(1,2)==2 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==42;

if icase1
   [ C_Lagrange ] = C_LagrangeMatrixRVELinear  (AssembyMatrix, AppliedDisplacements, InputMultiscaleIndex,ivector);

elseif icase2                                                                          
   [ C_Lagrange ] = C_LagrangeMatrixRVEPeriodic(NumberOfKinematicDescriptions, AssembyMatrix, InputMultiscaleIndex,ivector); 

end


end

