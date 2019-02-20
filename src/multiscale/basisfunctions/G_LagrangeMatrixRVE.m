function [ G_Lagrange ] = G_LagrangeMatrixRVE(NumberOfKinematicDescriptions,AppliedDisplacements,InputIndex)
% Define the G Lagrange Matrix

ibc_type=InputIndex.AnalIndex.MultiscaleIndex(1,2);

G_Lagrange=zeros(1,NumberOfKinematicDescriptions);
    
switch ibc_type
    case {1, 3, 4, 32}
        G_Lagrange(1,NumberOfKinematicDescriptions)=0.01;
    case {2, 42}
        for j=1:NumberOfKinematicDescriptions
            G_Lagrange(1,j)=0.01*AppliedDisplacements(j,1);
        end
end


  
end

