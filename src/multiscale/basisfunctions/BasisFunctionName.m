function [ fid ] = BasisFunctionName( i,InputIndex,InputMultiscaleIndex )
iMicro=InputMultiscaleIndex.MicrostructureIndex; %Define the Microstructure Type of RVE
[ Name ] = NameBoundaryConditions ( InputIndex ); %Name of Multiscale Boundary Conditions
path=strcat(InputIndex.JobIndex,filesep,'Draw',filesep,Name,filesep,'Microstructure',num2str(iMicro));
mkdir_if_not_exist(path); %Create subfolder of Microstructure
%Assign the basis function name
if i==1 
    BasFunName='N1x';
elseif i==2
    BasFunName='N1y';
elseif i==3
    BasFunName='N2x';
elseif i==4
    BasFunName='N2y';
elseif i==5
    BasFunName='N3x';
elseif i==6
    BasFunName='N3y';
elseif i==7
    BasFunName='N4x';
elseif i==8
    BasFunName='N4y';
end
%Assign final fid
if InputIndex.AnalIndex.MultiscaleIndex(1,2)==1 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==2 %case Linear /Periodic Boundary Conditions
    fid=strcat(path,filesep,BasFunName,'.png');
elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==3 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==4 %case  Oversampling Linear /Periodic Boundary Conditions (Temporary)
    fid=strcat(path,filesep,BasFunName,'_Temporary','.png');
elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==32 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==42 %case  Oversampling Linear /Periodic Boundary Conditions (Temporary)
    fid=strcat(path,filesep,BasFunName,'.png');
end
end

