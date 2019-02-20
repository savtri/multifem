function [ k ] = KCoarseMatrix( Fem,G,InputMultiscaleIndex )
%% Calculate the Equivalent Stiffness Matrix

%Define the number of macro degree of freedom in each RVE element
dof=InputMultiscaleIndex.DegreeOfFreedomCoarseMacro;

%Define the stiffness matrix of each RVE element
k=zeros(dof,dof);

for i=1:InputMultiscaleIndex.NumberOfElements %Loop for each finite element in RVE element  
   %Assign the degree of freedom of each finite element
   dofFE=Fem(i).nNodes*Fem(i).nDofsPerNode;
   %Assign element type
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
  %Fetch constitutive matrix
  [ De ] = ConstitutiveMatrix( E,v,ElementsType);
  %Define the coords of each finite element in RVE element 
  XYZ=Get_Element_Coords(InputMultiscaleIndex.IndexXYNodes,Fem(i).NodeIndex,ElementsType);                     
  kt=Get_Element_Stiffness(ElementsType,De,XYZ,thickness,InputMultiscaleIndex.NumberOfGaussPoints,dofFE);         
  %Equivalent stiffness matrix
  k=k+transpose(G{i})*kt*G{i};
end
end