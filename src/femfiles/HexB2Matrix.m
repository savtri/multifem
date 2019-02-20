function [ B2 ] = HexB2Matrix( DerivativesOfShapeFunction )
%% Calculate B2 matrix
B2=zeros(9,3*size(DerivativesOfShapeFunction,2));

%u
 B2(1,1)=DerivativesOfShapeFunction(1,1);
 B2(1,4)=DerivativesOfShapeFunction(1,2);
 B2(1,7)=DerivativesOfShapeFunction(1,3);
B2(1,10)=DerivativesOfShapeFunction(1,4);
B2(1,13)=DerivativesOfShapeFunction(1,5);
B2(1,16)=DerivativesOfShapeFunction(1,6);
B2(1,19)=DerivativesOfShapeFunction(1,7);
B2(1,22)=DerivativesOfShapeFunction(1,8);

 B2(2,1)=DerivativesOfShapeFunction(2,1);
 B2(2,4)=DerivativesOfShapeFunction(2,2);
 B2(2,7)=DerivativesOfShapeFunction(2,3);
B2(2,10)=DerivativesOfShapeFunction(2,4);
B2(2,13)=DerivativesOfShapeFunction(2,5);
B2(2,16)=DerivativesOfShapeFunction(2,6);
B2(2,19)=DerivativesOfShapeFunction(2,7);
B2(2,22)=DerivativesOfShapeFunction(2,8);

 B2(3,1)=DerivativesOfShapeFunction(3,1);
 B2(3,4)=DerivativesOfShapeFunction(3,2);
 B2(3,7)=DerivativesOfShapeFunction(3,3);
B2(3,10)=DerivativesOfShapeFunction(3,4);
B2(3,13)=DerivativesOfShapeFunction(3,5);
B2(3,16)=DerivativesOfShapeFunction(3,6);
B2(3,19)=DerivativesOfShapeFunction(3,7);
B2(3,22)=DerivativesOfShapeFunction(3,8);

%v
 B2(4,2)=DerivativesOfShapeFunction(1,1);
 B2(4,5)=DerivativesOfShapeFunction(1,2);
 B2(4,8)=DerivativesOfShapeFunction(1,3);
B2(4,11)=DerivativesOfShapeFunction(1,4);
B2(4,14)=DerivativesOfShapeFunction(1,5);
B2(4,17)=DerivativesOfShapeFunction(1,6);
B2(4,20)=DerivativesOfShapeFunction(1,7);
B2(4,23)=DerivativesOfShapeFunction(1,8);

 B2(5,2)=DerivativesOfShapeFunction(2,1);
 B2(5,5)=DerivativesOfShapeFunction(2,2);
 B2(5,8)=DerivativesOfShapeFunction(2,3);
B2(5,11)=DerivativesOfShapeFunction(2,4);
B2(5,14)=DerivativesOfShapeFunction(2,5);
B2(5,17)=DerivativesOfShapeFunction(2,6);
B2(5,20)=DerivativesOfShapeFunction(2,7);
B2(5,23)=DerivativesOfShapeFunction(2,8);

 B2(6,2)=DerivativesOfShapeFunction(3,1);
 B2(6,5)=DerivativesOfShapeFunction(3,2);
 B2(6,8)=DerivativesOfShapeFunction(3,3);
B2(6,11)=DerivativesOfShapeFunction(3,4);
B2(6,14)=DerivativesOfShapeFunction(3,5);
B2(6,17)=DerivativesOfShapeFunction(3,6);
B2(6,20)=DerivativesOfShapeFunction(3,7);
B2(6,23)=DerivativesOfShapeFunction(3,8);
%w
 B2(7,3)=DerivativesOfShapeFunction(1,1);
 B2(7,6)=DerivativesOfShapeFunction(1,2);
 B2(7,9)=DerivativesOfShapeFunction(1,3);
B2(7,12)=DerivativesOfShapeFunction(1,4);
B2(7,15)=DerivativesOfShapeFunction(1,5);
B2(7,18)=DerivativesOfShapeFunction(1,6);
B2(7,21)=DerivativesOfShapeFunction(1,7);
B2(7,24)=DerivativesOfShapeFunction(1,8);

 B2(8,3)=DerivativesOfShapeFunction(2,1);
 B2(8,6)=DerivativesOfShapeFunction(2,2);
 B2(8,9)=DerivativesOfShapeFunction(2,3);
B2(8,12)=DerivativesOfShapeFunction(2,4);
B2(8,15)=DerivativesOfShapeFunction(2,5);
B2(8,18)=DerivativesOfShapeFunction(2,6);
B2(8,21)=DerivativesOfShapeFunction(2,7);
B2(8,24)=DerivativesOfShapeFunction(2,8);

 B2(9,3)=DerivativesOfShapeFunction(3,1);
 B2(9,6)=DerivativesOfShapeFunction(3,2);
 B2(9,9)=DerivativesOfShapeFunction(3,3);
B2(9,12)=DerivativesOfShapeFunction(3,4);
B2(9,15)=DerivativesOfShapeFunction(3,5);
B2(9,18)=DerivativesOfShapeFunction(3,6);
B2(9,21)=DerivativesOfShapeFunction(3,7);
B2(9,24)=DerivativesOfShapeFunction(3,8);

end
