function [ P ] = ExternalForceMatrix( InputIndex )
% External Forces
P=zeros(InputIndex.DegreeOfFreedom,1);
nDofs=InputIndex.nDim;
for i=1: InputIndex.Loads.NumberOfIndividualLoads
    for idof=1:nDofs
        P(nDofs*(InputIndex.Loads.IndividualLoadIndex(i,1)-1)+idof,1)= InputIndex.Loads.IndividualLoadIndex(i,idof+1);
    end

end

end

