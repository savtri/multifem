function [ B2 ] = PlaneStressB2Matrix( DerivativesOfShapeFunction )
%% Calculate B2 matrix
B2=zeros(4,2*size(DerivativesOfShapeFunction,2));
for k=1:size(DerivativesOfShapeFunction,2)
    B2(1,2*k-1)=DerivativesOfShapeFunction(1,k);
    B2(2,2*k-1)=DerivativesOfShapeFunction(2,k);
    B2(3,2*k)=DerivativesOfShapeFunction(1,k);
    B2(4,2*k)=DerivativesOfShapeFunction(2,k);
    k=k+1;
end
end

