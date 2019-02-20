function [ C_Lagrange ] = C_LagrangeMatrixRVELinear(AssembyMatrix,AppliedDisplacements,InputMultiscaleIndex,ivector)
%
nkd=size(AssembyMatrix,1);
%
switch ivector
    case 0
        dof = InputMultiscaleIndex.NumberofNodes ;
    case 1
        dof=InputMultiscaleIndex.DegreeOfFreedomCoarseMicro;
end
%
C_Lagrange=zeros(nkd,dof);
C_Lagrange(:,AssembyMatrix(:,1))=1;
for j=1:nkd-1
   C_Lagrange(j,AssembyMatrix(j,2))=-1/AppliedDisplacements(j,1);                     
end                 

end

