function [ InputIndex ] = ReadMultiscaleIndexes( text,textAddress,InputIndex )
%% Define the Input Data File name 
fid=InputIndex.InputAdressIndex;

%% Read the multiscale index
idx = find(~cellfun('isempty',strfind(text,'$MULTISCALE'))) + 1;
LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
MultiscaleIndex(1,:)=LWm;
InputIndex.AnalIndex.MultiscaleIndex=MultiscaleIndex; 

%% Create Multiscale folders and paths
NameInput=InputIndex.JobIndex;
mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Draw'));
mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Output'));
mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Input'));
copyfile(fid,strcat(InputIndex.JobIndex,filesep,'Input',filesep,'Input',NameInput,'.inp'),'f');
textAddress(2,:)=cellstr(strcat('Input',NameInput,'.inp'));
fidAd=strcat(InputIndex.JobIndex,filesep,'Input',filesep,'InputAddressFile.inp');
fidAd=fopen(fidAd,'w');
%Change the path in InputAddressFile.inp
for i=1:2
    LWm = cellfun(@(x) textscan(x,'%c'),textAddress(i),'un',0);
    LWm = cell2mat([LWm{:}]).';
    fprintf(fidAd,'%s\n',LWm);
end
fidAd=fclose(fidAd);
%Create subfolders 
if InputIndex.AnalIndex.MultiscaleIndex(1,2)==1 %Linear Boundary Conditions
    mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Draw',filesep,'Linear'));
    mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Output',filesep,'Linear'));
elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==2 %Periodic Boundary Conditions
    mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Draw',filesep,'Periodic'));
    mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Output',filesep,'Periodic'));
elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==3 %Oversampling Linear Boundary Conditions
    mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Draw',filesep,'OversamplingLinear'));
    mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Output',filesep,'OversamplingLinear'));
elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==4 %Oversampling Periodic Boundary Conditions
    mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Draw',filesep,'OversamplingPeriodic'));
    mkdir_if_not_exist(strcat(InputIndex.JobIndex,filesep,'Output',filesep,'OversamplingPeriodic'));
end

%% Read the address of the multiscale input data file
%Linear Boundary Conditions
idx = find(~cellfun('isempty',strfind(text,'$INPUT_ADDRESS_FILE_MULTISCALE_LINEAR'))) + 1;
LWm = cellfun(@(x) textscan(x,'%c'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
MultiscaleAdressLinearIndex(1,:)=LWm;

Ctmp=strsplit(MultiscaleAdressLinearIndex,filesep);
aFileName=Ctmp{end};

InputIndex.AnalIndex.MultiscaleAdressLinearIndex=strcat('Input',filesep,MultiscaleAdressLinearIndex);
copyfile(InputIndex.AnalIndex.MultiscaleAdressLinearIndex,strcat(InputIndex.JobIndex,filesep,'Input',filesep,aFileName),'f');
    
% Periodic Boundary Conditions
idx = find(~cellfun('isempty',strfind(text,'$INPUT_ADDRESS_FILE_MULTISCALE_PERIODIC'))) + 1;
LWm = cellfun(@(x) textscan(x,'%c'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
MultiscaleAdressPeriodicIndex(1,:)=LWm;

Ctmp=[];
Ctmp=strsplit(MultiscaleAdressPeriodicIndex,filesep);
aFileName=Ctmp{end};

InputIndex.AnalIndex.MultiscaleAdressPeriodicIndex=strcat('Input',filesep,MultiscaleAdressPeriodicIndex);
copyfile(InputIndex.AnalIndex.MultiscaleAdressPeriodicIndex,strcat(InputIndex.JobIndex,filesep,'Input',filesep,aFileName),'f');

%Oversampling Linear Boundary Conditions
idx = find(~cellfun('isempty',strfind(text,'$INPUT_ADDRESS_FILE_MULTISCALE_OVERSAMPLING_LINEAR'))) + 1;
LWm = cellfun(@(x) textscan(x,'%c'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
MultiscaleAdressOversamplingLinearIndex(1,:)=LWm;

Ctmp=[];
Ctmp=strsplit(MultiscaleAdressOversamplingLinearIndex,filesep);
aFileName=Ctmp{end};

InputIndex.AnalIndex.MultiscaleAdressOversamplingLinearIndex=strcat('Input',filesep,MultiscaleAdressOversamplingLinearIndex);
copyfile(InputIndex.AnalIndex.MultiscaleAdressOversamplingLinearIndex,strcat(InputIndex.JobIndex,filesep,'Input',filesep,aFileName),'f');
    
%Oversampling Periodic Boundary Conditions
idx = find(~cellfun('isempty',strfind(text,'$INPUT_ADDRESS_FILE_MULTISCALE_OVERSAMPLING_PERIODIC'))) + 1;
LWm = cellfun(@(x) textscan(x,'%c'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
MultiscaleAdressOversamplingPeriodicIndex(1,:)=LWm;

Ctmp=[];
Ctmp=strsplit(MultiscaleAdressOversamplingPeriodicIndex,filesep);
aFileName=Ctmp{end};

InputIndex.AnalIndex.MultiscaleAdressOversamplingPeriodicIndex=strcat('Input',filesep,MultiscaleAdressOversamplingPeriodicIndex);
copyfile(InputIndex.AnalIndex.MultiscaleAdressOversamplingPeriodicIndex,strcat(InputIndex.JobIndex,filesep,'Input',filesep,aFileName),'f');

%N problem dimension
idx = find(~cellfun('isempty',strfind(text,'$NDIM'))) + 1;
LWm = cellfun(@(x) textscan(x,'%c'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
Ndimension(1,:)=LWm;
InputIndex.nDim=str2num(Ndimension(1,:));

end

