function [ B1 ] = B1Matrix( Jacob,ElementType )
% Calculate B1 matrix

switch ElementType
    case 1 %Q4 Plane Stress
        [ B1 ] = PlaneStressB1Matrix( Jacob );
    case 11 %HexElement
        [ B1 ] = HexB1Matrix( Jacob );
end

end

