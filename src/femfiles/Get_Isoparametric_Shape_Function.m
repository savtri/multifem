function N=Get_Isoparametric_Shape_Function(iType, inod, X)

switch iType
    case 1 %Q4
        xi=X(1);
        eta=X(2);
        
        [ShapeFunction,DerivativesOfShapeFunction]=SFQ4(xi,eta);         
        
    case 11 %Hex-Solid
         xi=X(1);
         eta=X(2);
        zeta=X(3);
        
        [ShapeFunction,DerivativesOfShapeFunction]=SF3DQ8(xi,eta,zeta);
                        
end


N=ShapeFunction(inod,1);

end