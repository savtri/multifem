function k=Get_Element_Stiffness(iType,De,Coords,thickness,ngaussp,dofFE)

%Define the stiffness matrix of each finite element in RVE element
k=zeros(dofFE,dofFE);
   
%Gauss quadrature rule (weights and locations)      
[ wt,loc ] = GaussPointsQuadrature(ngaussp , iType);

for j=1:ngaussp      
      gp=loc(j,:);                                                     
      xi=gp(1);
      eta=gp(2);
      %
      if iType==11
        zeta=gp(3);
      else
        zeta=0;
      end      
      %Shape functions and Derivatives of shape functions
      [ShapeFunction,DerivativesOfShapeFunction] =Get_Element_Shape_Functions(xi, eta, zeta, iType);     % Shape functions and Derivatives of shape functions 
      %Calculate the Jacobian  
      [Jacob]=CalculateJacobian(Coords,DerivativesOfShapeFunction);
      %Calculate the Volume of element
      dVolume=det(Jacob)*wt(j,1)*thickness;
      %Calculate B1 Matrix
      [ B1 ] = B1Matrix( Jacob,iType);
      %Calculate B2 matrix
      [ B2 ] = B2Matrix( DerivativesOfShapeFunction,iType);
      %Calculate B matrix
      [ B ] = B1*B2;       
      %Stiffness matrix of RVE element 
      k=k+B'*De*B*dVolume;
end   

end