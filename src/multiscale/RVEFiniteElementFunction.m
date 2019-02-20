function [ Femt ] = RVEFiniteElementFunction( n,InputMultiscaleIndex )

%
itype   = InputMultiscaleIndex.Elements(n,2);
%
theNodes=GetElementNodes(InputMultiscaleIndex.Elements(n,:));

Femt.NodeIndex(1,:)=theNodes;                           %Assign the connectivity finite element in RVE
Femt.GroupType=InputMultiscaleIndex.Elements(n,end); %Assign the microstructure type of finite element in RVE
Femt.ElementType=InputMultiscaleIndex.Elements(n,2); %Assign the Element Type
%% Generic Vars
Femt.nNodes=length(Femt.NodeIndex(1,:));

Femt.nDofsPerNode=GetDofsPerNode(itype);
end

