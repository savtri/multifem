function [ B1 ] = HexB1Matrix( Jacob )
%% Calculate B1 matrix
B1=zeros(6,9);
detJacob=det(Jacob);

invJ=[Jacob(3,3)*Jacob(2,2)-Jacob(3,2)*Jacob(2,3) -(Jacob(3,3)*Jacob(1,2)-Jacob(3,2)*Jacob(1,3)) Jacob(2,3)*Jacob(1,2)-Jacob(2,2)*Jacob(1,3);
-(Jacob(3,3)*Jacob(2,1)-Jacob(3,1)*Jacob(2,3))   Jacob(3,3)*Jacob(1,1)-Jacob(3,1)*Jacob(1,3)  -(Jacob(2,3)*Jacob(1,1)-Jacob(2,1)*Jacob(1,3));
 Jacob(3,2)*Jacob(2,1)-Jacob(3,1)*Jacob(2,2)  -(Jacob(3,2)*Jacob(1,1)-Jacob(3,1)*Jacob(1,2))   Jacob(2,2)*Jacob(1,1)-Jacob(2,1)*Jacob(1,2)];

B1(1,1)=invJ(1,1);
B1(1,2)=invJ(1,2);
B1(1,3)=invJ(1,3);

B1(2,4)=invJ(2,1);
B1(2,5)=invJ(2,2);
B1(2,6)=invJ(2,3);

B1(3,7)=invJ(3,1);
B1(3,8)=invJ(3,2);
B1(3,9)=invJ(3,3);

B1(4,1)=invJ(2,1);
B1(4,2)=invJ(2,2);
B1(4,3)=invJ(2,3);
B1(4,4)=invJ(1,1);
B1(4,5)=invJ(1,2);
B1(4,6)=invJ(1,3);

B1(5,4)=invJ(3,1);
B1(5,5)=invJ(3,2);
B1(5,6)=invJ(3,3);
B1(5,7)=invJ(2,1);
B1(5,8)=invJ(2,2);
B1(5,9)=invJ(2,3);

B1(6,1)=invJ(3,1);
B1(6,2)=invJ(3,2);
B1(6,3)=invJ(3,3);
B1(6,7)=invJ(1,1);
B1(6,8)=invJ(1,2);
B1(6,9)=invJ(1,3);



B1=1/detJacob*B1;


end