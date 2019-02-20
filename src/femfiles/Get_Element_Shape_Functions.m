function [ShapeFunction,DerivativesOfShapeFunction]=Get_Element_Shape_Functions(xi, eta, zeta, ElementType)

if ElementType==1 %Quad Plane Stress
    [ShapeFunction,DerivativesOfShapeFunction]=SFQ4(xi,eta);
elseif ElementType==11 %Hex Element
    [ShapeFunction,DerivativesOfShapeFunction]=SF3DQ8(xi,eta,zeta);        
end
    

    
    


end