function [ X ] = LagrangeMultiplierProcedure( UnKnowns,Knowns,V,nkc,A,B,G,f )

% Lagrange Multiplier Method
% UnKnowns: Number of Unknowns (displacements, pressures, etc.)
% Knowns  : Number of Knowns   (displacements, pressures, etc.)
% V       : Transormation matrix 
% nkc     : NumberOfKinematicDescriptions (Number of Lagrange Multipliers)
% A       : The original matrix (i.e. stiffness/permiability etc.)
% B       : Lagrange Matrix UnKnowns*nkc (Bathe FEM p. 145)
% G       : Lagrange Matrix nkc*1        (Bathe FEM p. 145)
% f       : Externaly applied load


us=zeros(Knowns,1);                     % Known displacement field

Kffg=[A ,  B             ;
      B', zeros(nkc,nkc)];              % Generalized stiffness matrix (with kinematic constrains)
  
Rg=[f; G'];                             % Generalized external force matrix (with kinematic constrains)

ug=Kffg\Rg;                             % Displacement field together with Lagrange Multipliers

X=transpose(V)\[ug(1:UnKnowns,1);us];   % Displacement field

end

