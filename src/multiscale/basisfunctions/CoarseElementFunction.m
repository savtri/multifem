function [ Coarset ] = CoarseElementFunction( n,InputIndex )

itype=InputIndex.Elements(n,2);
theNodes=GetElementNodes(InputIndex.Elements(n,:));
Coarset.NodeIndex(1,:)=theNodes; %Assign the connectivity of coarse  
%Coarse Element architecture
Coarset.iType=InputIndex.Elements(n,2);
%
Coarset.MicrostructureType=InputIndex.Elements(n,end); %Assign the microstructure type of coarse element 
%% Generic Vars
Coarset.nNodes=length(Coarset.NodeIndex(1,:));

Coarset.nDofsPerNode=GetDofsPerNode(itype);

Coarset.nSurfaces=GetElementSurfaces(itype);

end

