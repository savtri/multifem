function K=BuildCoarseStiff( Coarse,RVE,InputIndex )
%% Evaluate the Global Stiffness matrix
%Define the Global Macro Stiffness Matrix  
K = zeros(InputIndex.DegreeOfFreedom);

for i=1:InputIndex.NumberOfElements %Loop for each coarse element
    iMicro=Coarse(i).MicrostructureType;
    k=RVE{iMicro}.k; %Assign the Equivalent stiffness matrix
    %Global stiffness matrix
    [ K ] = StiffnessMatrixCoarse( i,K,k,Coarse );    
end

end