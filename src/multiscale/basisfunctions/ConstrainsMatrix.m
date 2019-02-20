function [ Constrains, PressConstrains ] = ConstrainsMatrix( InputIndex )
%% Constrains Matrix ('0' = constrain, '1' = unconstrain )

Constrains      =ones(InputIndex.DegreeOfFreedom,1);
PressConstrains =ones(InputIndex.NumberOfNodes,1)  ;

nDofs=InputIndex.nDim;

for i=1:InputIndex.Constrains.NumberOfNodalDispConst
    for idof=1:nDofs
        Constrains(nDofs*(InputIndex.Constrains.IndividualDispConstIndex(i,1)-1)+idof,1)= ...
            InputIndex.Constrains.IndividualDispConstIndex(i,idof+1);
    end       
end

end

