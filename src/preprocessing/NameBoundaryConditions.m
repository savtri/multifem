function [ Name ] = NameBoundaryConditions ( InputIndex )
if InputIndex.AnalIndex.MultiscaleIndex(1,2)==1 %Linear Boundary Conditions
    Name='Linear';
elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==2 %Periodic Boundary Conditions
    Name='Periodic';
elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==3 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==32 %Oversampling Linear Boundary Conditions
    Name='OversamplingLinear';
elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==4 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==42 %Oversampling Periodic Boundary Conditions
    Name='OversamplingPeriodic';
end
end

