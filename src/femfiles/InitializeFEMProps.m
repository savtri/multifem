function [ Fem,GP, InputIndex,InputMultiscaleIndex ] = InitializeFEMProps( Fem,InputIndex,InputMultiscaleIndex )
%
nDim        = InputIndex.nDim;
ElementsType=InputMultiscaleIndex.iType;
%--------------------------------------------------------------------------------------------------------------------------------------
% Initialize Fem Properties
% Initialize Gauss Integration Point Locations in each Macro FE
%--------------------------------------------------------------------------------------------------------------------------------------    
    iid=1;                                                                 % Assign the first Integration Point
    for i=1:InputMultiscaleIndex.NumberOfElements                       % Loop for All micro Elements
       for j=1:InputIndex.NumberOfIntegPoints                              % Loop for All Integration Points
           GP.GroupType(iid,1)=Fem(i).GroupType;                           % Assign GroupType
           Fem(i).GPs(j,1)=iid;                                            % Assign Gauss Point Indices
           iid=iid+1;                                                      % Assign the Next Integration Point
       end
       % Fem.Children{i,1}=[];                                             %Initialize empty children index (For Adaptive Mesh Refinement) 
    end
    
%--------------------------------------------------------------------------------------------------------------------------------------    
% Initialize Gauss Integration Point Coords
%--------------------------------------------------------------------------------------------------------------------------------------
 
    ngp = InputIndex.NumberOfIntegPoints;
    for i=1:InputMultiscaleIndex.NumberOfElements                       % Loop for All micro Elements
        gpmic   = Fem(i).GPs ;                                             % Gauss Points in that micro FE                        
        %        
        XYZ=Get_Element_Coords(InputMultiscaleIndex.IndexXYNodes,Fem(i).NodeIndex,ElementsType);                                    
                                
       [ wt,loc ] = GaussPointsQuadrature(ngp, Fem(i).ElementType);        % Assign Integration Point Weights and Locations 
                                                                           % Gauss Quadrature Rule    
       for j=1: ngp                                                        % Loop each Gauss Point
           gp = loc(j,:);                                                     
           xi = gp(1)   ;
           eta= gp(2)   ;         
           
           if nDim==3
               zeta=gp(3);
           else
               zeta=0;
           end
           
           [ShapeFunction,DerivativesOfShapeFunction] =Get_Element_Shape_Functions(xi, eta, zeta, Fem(i).ElementType) ;     % Shape functions and Derivatives of shape functions 
           [Jacob] =CalculateJacobian(XYZ,DerivativesOfShapeFunction);     %Calculate the Jacobian 
           
           GP.coords(gpmic(j,1),:) = ShapeFunction'*XYZ';                  % Calculate GP Coordinates in each micro FE  
           
           
           switch Fem(i).ElementType
               case 1 %Quad Plane Stress
                    ithickness = InputMultiscaleIndex.thickness(Fem(i).GroupType);  % Assigne thickness of that micro FE        
               case 11 %Hex-solid
                    ithickness=1;
           end           
           GP.vol(gpmic(j,1),1)  = det(Jacob)*wt(j,1)*ithickness ;         % Calculate the Volume of element 
       end
       
    end 
            
end

