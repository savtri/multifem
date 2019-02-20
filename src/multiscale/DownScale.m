function [ Coarse ]= DownScale( U,RVE,Coarse,InputIndex)
for i=1:InputIndex.NumberOfElements %Loop for each coarse element  
    iMicro=Coarse(i).MicrostructureType; %Microstructure Type
    %Evaluate the micro displacement field in each coarse element
    [ Coarse(i).um ] = MicroDisplacementsInEachCoarse(  i,iMicro,U,RVE,Coarse );
    nElRVE=size(RVE{iMicro,1}.Fem,2);  
    for g=1:nElRVE %Loop for each finite element in RVE element  
        ElementsType=RVE{iMicro,1}.Fem(g).ElementType;
        %Define the Young's modulus
        E=InputIndex.E(RVE{iMicro}.Fem(g).GroupType);
        %Define the Poisson Ratio
        v=InputIndex.v(RVE{iMicro}.Fem(g).GroupType); 
        %Define the coords of each finite element in RVE element
        XYZ(1,:)=RVE{iMicro}.XYZ(RVE{iMicro}.Fem(g).NodeIndex,2)';
        XYZ(2,:)=RVE{iMicro}.XYZ(RVE{iMicro}.Fem(g).NodeIndex,3)';
        if ElementsType==11
            XYZ(3,:)=RVE{iMicro}.XYZ(RVE{iMicro}.Fem(g).NodeIndex,4)';
        end
        %
        for j=1:InputIndex.NumberOfIntegPoints %Loop for each Gauss Point                                              
            %Gauss quadrature rule (weights and locations)      
            [ wt,loc ] = GaussPointsQuadrature(InputIndex.NumberOfIntegPoints , ElementsType);
            gp=loc(j,:);                                                     
            xi=gp(1);
            eta=gp(2);
            %
            if ElementsType==11
              zeta=gp(3);
            else
              zeta=0;
            end
            %
            %Shape functions and Derivatives of shape functions
            [ShapeFunction,DerivativesOfShapeFunction] =Get_Element_Shape_Functions(xi, eta, zeta, ElementsType);     % Shape functions and Derivatives of shape functions 
            %Calculate the Jacobian  
            [Jacob]=CalculateJacobian(XYZ,DerivativesOfShapeFunction);                        
            %Calculate B1 Matrix
            [ B1 ] = B1Matrix( Jacob,ElementsType);
            %Calculate B2 matrix
            [ B2 ] = B2Matrix( DerivativesOfShapeFunction,ElementsType);
            %Calculate B matrix
            [ B ] = B1*B2;
            %Calculate constitutive matrix
            [ De ] = ConstitutiveMatrix( E,v,ElementsType );
            %Evaluate the micro displacements of finite element in RVE element
            [ umf ] = MicroDisplacementsFiniteElement( g,iMicro,RVE,Coarse(i).um );
            Coarse(i).Micro(g).umf=umf;
            %Micro strains in gauss point
            egp(:,1)=B*umf;
            Coarse(i).Micro(g).egp(:,j)=egp(:,1);
            %Micro stresses in gauss point
            Coarse(i).Micro(g).sgp(:,j)=De*egp(:,1);
        end        
    end
end
end