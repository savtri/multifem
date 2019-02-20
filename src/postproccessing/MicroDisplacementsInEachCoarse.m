function [ um ] = MicroDisplacementsInEachCoarse(  i,iMicro,U,RVE,Coarse )
%% Evaluate the micro displacement field in each coarse element
nnEl=Coarse(i).nNodes; %Number of nodes in each coarse element

nDofs=Coarse(i).nDofsPerNode;

n=zeros(nnEl,1); %Nodes Connectivity of element
uM=zeros(nDofs*nnEl,1); %Define local displacement  field
for k=1:nnEl
    n(k,1)=Coarse(i).NodeIndex(1,k);    
    for idof=1:nDofs
       uM(nDofs*(k-1)+idof)=U(nDofs*(n(k,1)-1)+idof); 
    end        
end
%Microdisplacement field
um=RVE{iMicro}.N*uM;
end

