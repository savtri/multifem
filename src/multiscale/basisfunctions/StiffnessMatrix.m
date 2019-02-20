function [ K ] = StiffnessMatrix( i,K,k,Fem )
%% Global stiffness matrix
sctrB=[];
nDofs=Fem(i).nDofsPerNode;

for j=1:size(Fem(i).NodeIndex,2)    
    for idof=1:nDofs
        sctrB=[sctrB nDofs*(Fem(i).NodeIndex(1,j)-1)+idof];
    end
end
K(sctrB,sctrB) = K(sctrB,sctrB)+k;
end

