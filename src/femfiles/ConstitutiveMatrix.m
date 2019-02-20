function [ De ] = ConstitutiveMatrix( E,v,ElementsType )
switch ElementsType
    case 1 %Plane Stress Element
        [ De ] = PlaneStressElasticTensor( E,v);
    case 2 %Plane Strain Element
        [ De ] = PlaneStrainElasticTensor( E,v );
    case 11 %3D constitutive tensor
        [ De ] = ThreeDimensionalElasticTensor( E,v );
    otherwise
        disp('Error in Elastic Tensor')
end

