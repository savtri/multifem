function [ K ] = StiffnessMatrixCoarse( i,K,k,Coarse,nMacroDofs )
%% Find Global Degree of Freedom in i element
sctrB=[];

nDofs=Coarse(i).nDofsPerNode;

for j=1:size(Coarse(i).NodeIndex,2)    
    for idof=1:nDofs
        sctrB=[sctrB nDofs*(Coarse(i).NodeIndex(1,j)-1)+idof];
    end
end


%% Assign to Global Stiffness Matrix
K(sctrB,sctrB) = K(sctrB,sctrB)+k;
end

