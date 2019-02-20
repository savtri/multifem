function [ umf ] = MicroDisplacementsFiniteElement( g,iMicro,RVE,um )
%% Evaluate the micro displacements of finite element in RVE element
nMicroNodes=RVE{iMicro}.Fem(g).nNodes; %Number of Finite Element Nodes
nDofs=RVE{iMicro}.Fem(g).nDofsPerNode;

for k=1:nMicroNodes %Loop for all nodes
    n(k,1)=RVE{iMicro}.Fem(g).NodeIndex(1,k);
    
    for idof=1:nDofs    
        umf(nDofs*(k-1)+idof,1)=um(nDofs*(n(k,1)-1)+idof,1);
    end
end
end

