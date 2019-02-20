function [ K ] = StiffnessMatrixRVE( Fem,InputIndex,InputMultiscaleIndex )
%% Assign stiffness matrix
K=zeros(InputMultiscaleIndex.DegreeOfFreedomCoarseMicro);
%% Number Of Gauss Points
InputMultiscaleIndex.NumberOfGaussPoints = InputIndex.NumberOfIntegPoints;
%% Calculate the RVE stiffness matrix
for i=1:InputMultiscaleIndex.NumberOfElements %Loop for each finite element in RVE element  
   %Assign the degree of freedom of each finite element
   dofFE=Fem(i).nNodes*Fem(i).nDofsPerNode;
   %Define the stiffness matrix of each finite element in RVE element
   k=zeros(dofFE,dofFE);
   %Assign the Elements Type
   ElementsType=Fem(i).ElementType;
   %Young's modulus of RVE element
   E=InputMultiscaleIndex.E(Fem(i).GroupType);
   %Poisson of RVE element
   v=InputMultiscaleIndex.v(Fem(i).GroupType);
   %Thickness of RVE element
   switch ElementsType
       case 11
            thickness=1;
       otherwise
           thickness=InputMultiscaleIndex.thickness(Fem(i).GroupType);
   end
   %
   %Gauss quadrature rule (weights and locations)      
  [ wt,loc ] = GaussPointsQuadrature(InputMultiscaleIndex.NumberOfGaussPoints , ElementsType);
  %Coords of RVE element 
  XYZ=Get_Element_Coords(InputMultiscaleIndex.IndexXYNodes,Fem(i).NodeIndex,ElementsType);           
   for j=1:InputMultiscaleIndex.NumberOfGaussPoints %Loop for each Gauss Point              
      gp=loc(j,:);                                                     
      xi=gp(1);
      eta=gp(2);
      
      if ElementsType==11
        zeta=gp(3);
      else
        zeta=0;
      end
      
      %Shape functions and Derivatives of shape functions
      [ShapeFunction,DerivativesOfShapeFunction] =Get_Element_Shape_Functions(xi, eta, zeta, Fem(i).ElementType);     % Shape functions and Derivatives of shape functions 
      %Calculate the Jacobian  
      [Jacob]=CalculateJacobian(XYZ,DerivativesOfShapeFunction);
      %Calculate the Volume of element
      dVolume=det(Jacob)*wt(j,1)*thickness;
      %Calculate B1 Matrix
      [ B1 ] = B1Matrix( Jacob,ElementsType);
      %Calculate B2 matrix
      [ B2 ] = B2Matrix( DerivativesOfShapeFunction,ElementsType);
      %Calculate B matrix
      [ B ] = B1*B2;
      %Calculate constitutive matrix
      [ De ] = ConstitutiveMatrix( E,v,ElementsType );
      %Stiffness matrix of RVE element      
      k=k+B'*De*B*dVolume;
   end
   %Global stiffness matrix
   [ K ] = StiffnessMatrix( i,K,k,Fem );
end
end

