function [ fidRVE ] = ReadRVEAdressFile( InputIndex )
% Read the address file according to Boundary Conditions

if InputIndex.AnalIndex.MultiscaleIndex(1,2)    ==1     %case Linear Boundary COnditions
    fidRVE=char(InputIndex.AnalIndex.MultiscaleAdressLinearIndex);

elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==2     %case Periodic Boundary COnditions
    fidRVE=char(InputIndex.AnalIndex.MultiscaleAdressPeriodicIndex);    

elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==3     %case Oversampling Linear Boundary COnditions
    fidRVE=char(InputIndex.AnalIndex.MultiscaleAdressOversamplingLinearIndex); 

elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==4     %case Oversampling Periodic Boundary COnditions
    fidRVE=char(InputIndex.AnalIndex.MultiscaleAdressOversamplingPeriodicIndex);

end
end

