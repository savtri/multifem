function [ShapeFunction,DerivativesOfShapeFunction]=SF3DQ8(xi,eta,zeta)

%% Calculate the shape functions
ShapeFunction=1/8*[(1-xi)*(1-eta)*(1-zeta);
                   (1+xi)*(1-eta)*(1-zeta);
                   (1+xi)*(1+eta)*(1-zeta);
                   (1-xi)*(1+eta)*(1-zeta);
                   (1-xi)*(1-eta)*(1+zeta);
                   (1+xi)*(1-eta)*(1+zeta);
                   (1+xi)*(1+eta)*(1+zeta);
                   (1-xi)*(1+eta)*(1+zeta)];

%% Calculate the derivates of shape functinons
DerivativesOfShapeFunction=1/8*[-(1-eta)*(1-zeta), (1-eta)*(1-zeta), (1+eta)*(1-zeta), -(1+eta)*(1-zeta), ...
                                -(1-eta)*(1+zeta), (1-eta)*(1+zeta), (1+eta)*(1+zeta), -(1+eta)*(1+zeta);
                                 -(1-xi)*(1-zeta), -(1+xi)*(1-zeta),  (1+xi)*(1-zeta),   (1-xi)*(1-zeta), ...
                                 -(1-xi)*(1+zeta), -(1+xi)*(1+zeta),  (1+xi)*(1+zeta),   (1-xi)*(1+zeta);
                                 -(1-xi)*(1-eta) , -(1+xi)*(1-eta) , -(1+xi)*(1+eta) ,  -(1-xi)*(1+eta) , ...
                                  (1-xi)*(1-eta) ,  (1+xi)*(1-eta) ,  (1+xi)*(1+eta) ,   (1-xi)*(1+eta)];

end                              