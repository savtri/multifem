function [ B2 ] = B2Matrix( DerivativesOfShapeFunction, ElementType)
% Calculate B2 matrix

switch ElementType
    case 1 %Q4 Plane Stress
        [ B2 ] = PlaneStressB2Matrix(DerivativesOfShapeFunction);
    case 11 %HexElement
        [ B2 ] = HexB2Matrix( DerivativesOfShapeFunction);
end

end

