function [ Coarse,InputIndex ] = ReadInputData( fid,textAddress )
%% Input Data File name 
InputIndex.InputAdressIndex=fid;

%% Read the whole text
fid  = fopen(fid,'r');
text = textscan(fid,'%s','Delimiter','');
text = text{1};
fid  = fclose(fid);

%% Find the '$' and '$$' symbols in text 
[ InputIndex ] = Find2Dollar( text,InputIndex );

%% Read the name of Job
[ InputIndex ] = ReadJobName( text,InputIndex );

%% Read Multiscale Indexes
[ InputIndex ] = ReadMultiscaleIndexes( text,textAddress,InputIndex );

%% Read Gauss Integration Rule Index
[ InputIndex ] = ReadIntegrationRuleIndexes( text,InputIndex );

%% Read the coordinates of nodes                                 %SOS-This func is dof Depended (2per node) 
[ InputIndex ] = ReadCoordinatesOfNodes( text,InputIndex );

%% Read the connectivity of elements
[ InputIndex] = ReadConnectivityOfElements( text,InputIndex );
% Rearrange noder ordering
[InputIndex]=Reorder_Connectivity(InputIndex);

%% Read Boundary Conditions of Solid / Porous 
[ InputIndex ] = ReadAllBoundaryConditions( text,InputIndex );

%% Read Loads & Tractions
[ InputIndex ] = ReadAllLoads( text,InputIndex );

%% Read Output Indexes
[ InputIndex ] = ReadOutputIndexes( text,InputIndex );

%% Read Draw Indexes
[ InputIndex ] = ReadDrawIndexes( text,InputIndex );

%% Create Coarse Elements
[ Coarse ] = CreateCoarseElements( InputIndex );

%% Assign Figure ID 
[ InputIndex ] = AssignFigureID( InputIndex );

%% Draw Function
[ InputIndex ] = DrawFunction ( Coarse,InputIndex );

%% Delete unused variables
% field = 'Elements';
% InputIndex = rmfield(InputIndex,field);
end

