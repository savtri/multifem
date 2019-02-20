function [ Ngen, Xgen, InputIndex,InputMultiscaleIndex ]=Get_Multi_Shape_Function(adof,iMdof, anod, Matgen, Ngen, ...
                                                               NumberOfKinematicDescriptions,InputIndex,InputMultiscaleIndex)
      
      %Reallocate Stiffness/Permiability Matrices 
      K = Matgen(1:InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,...
                 1:InputMultiscaleIndex.DegreeOfFreedomCoarseMicro) ;                        
      %Define the Assembly Matrix of Nodes and Degree of Freedom                        
      [ AssembyMatrixTMP]       = AssembyMatrixRVE(adof,iMdof,anod,NumberOfKinematicDescriptions,InputIndex,InputMultiscaleIndex,1);                               
      %Applied Displacements in each surface
      [ AppliedDisplacements,AssembyMatrix ]= AppliedDisplacementsRVE(adof,iMdof,anod,InputIndex,InputMultiscaleIndex,AssembyMatrixTMP,1,0);
       NumberOfKinematicDescriptions=size(AssembyMatrix,1);              
      %Constrain Matrix
      [ Constrains ]       = ConstrainMatrixRVE      (adof,iMdof,anod,InputIndex,InputMultiscaleIndex,1);            
      %Define the C Lagrange Matrix
      [ C_Lagrange ]        = C_LagrangeMatrixRVE      (NumberOfKinematicDescriptions,AssembyMatrix,      AppliedDisplacements,InputIndex,InputMultiscaleIndex,1);                
      %Define the G Lagrange Matrix
      [ G_Lagrange ] = G_LagrangeMatrixRVE(NumberOfKinematicDescriptions,AppliedDisplacements,InputIndex);     
      %Known/Unknown Displacements for dofs and Nodes
      [ KnownDis,       UnKnownDis       ] = NumberOfKnownDisplacements( Constrains,      InputMultiscaleIndex.DegreeOfFreedomCoarseMicro );              
      %Define the Rearrange Matrix
      [ V ]       = VRearrangeFunction( Constrains,      InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,KnownDis       );            
      %Free free stifness matrix
      KV  = transpose(V)*K*V                          ;
      Kff = KV(1:UnKnownDis,1:UnKnownDis)             ;
      %Define the C_Lagrangeff Matrix
      C_LagrangeV       = transpose(V)      *C_Lagrange'      ;
      C_Lagrangeff      = C_LagrangeV      (1:UnKnownDis      ,1:NumberOfKinematicDescriptions);      
      % Zero External Force(p) Vectors
      pf  = zeros(UnKnownDis      ,1);         
      %Procedures (Lagrange Multiplier / Penalty Method)
      if     InputIndex.AnalIndex.MultiscaleIndex(1,3)==1                   % Lagrange Multiplier Method 
          [ u    ] = LagrangeMultiplierProcedure( UnKnownDis,      KnownDis,      V,      NumberOfKinematicDescriptions,Kff,C_Lagrangeff,      G_Lagrange,pf  );                
      elseif InputIndex.AnalIndex.MultiscaleIndex(1,3)==2                   % Penalty Method 
            par      = InputIndex.AnalIndex.MultiscaleIndex(1,4);           % Penalty Parameter for Solid     
            [ u ]    = PenaltyMethodProcedure( UnKnownDis,      KnownDis,      V,      par,     Kff, C_Lagrangeff,      G_Lagrange, pf );
      end
      %
      N (1:InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,adof ) = 100*u   ; 
      Ngen(1:InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,  adof)                                       = N(:,adof);
      Xgen(1:InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,  1)                                         = u;                                                                                                                                    
end   % End Function 