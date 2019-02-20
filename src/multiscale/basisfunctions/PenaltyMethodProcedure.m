function [ X ] = PenaltyMethodProcedure( UnKnowns,Knowns,V,ap,A,B,G,f )


% Penalty Method
% UnKnowns: Number of Unknowns (displacements, pressures, etc.)
% Knowns  : Number of Knowns   (displacements, pressures, etc.)
% V       : Transormation matrix 
% ap      : Penalty Parameter
% A       : The original matrix (i.e. stiffness/permiability etc.)
% B       : Lagrange Matrix UnKnowns*nkc (Bathe FEM p. 145)
% G       : Lagrange Matrix nkc*1        (Bathe FEM p. 145)
% f       : Externaly applied load


us=zeros(Knowns,1);                  %known displacement field

Kffg=A+ap*(B)*B';                    %Generalized stiffness matrix (with kinematic constrains)

Rg=f+ap*(B)*G';                      %Generalized external force matrix (with kinematic constrains)

ug=Kffg\Rg;                          %Displacement field

X=transpose(V)\[ug(1:UnKnowns,1);us];%Displacement field

end

