function [ShapeFunction,DerivativesOfShapeFunction]=SFQ4(xi,eta)

%% Calculate the shape functions
ShapeFunction=1/4*[(1-xi)*(1-eta);(1+xi)*(1-eta) ;
                   (1+xi)*(1+eta);(1-xi)*(1+eta)];

%% Calculate the derivates of shape functinons
DerivativesOfShapeFunction=1/4*[-(1-eta), 1-eta, 1+eta, -(1+eta) ;
                                -(1-xi) ,-(1+xi),1+xi,    1-xi];

end