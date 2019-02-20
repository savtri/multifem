function[ C_Lagrange ] = C_LagrangeMatrixRVEPeriodic(NumberOfKinematicDescriptions,AssembyMatrix,InputMultiscaleIndex,ivector)
   nkd=NumberOfKinematicDescriptions;      
   %
   switch ivector
    case 0
        dof = InputMultiscaleIndex.NumberofNodes ;
    case 1
        dof=InputMultiscaleIndex.DegreeOfFreedomCoarseMicro;
   end
    %      
   C_Lagrange=zeros(nkd,dof);
   for j=1:NumberOfKinematicDescriptions                     
       C_Lagrange(j,AssembyMatrix(j,1))=1;
       C_Lagrange(j,AssembyMatrix(j,2))=-1;
   end

end

