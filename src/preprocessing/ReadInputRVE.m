function [ Fem,InputIndex,InputMultiscaleIndex ] = ReadInputRVE( i,Coarse, InputIndex )
%% Read the address file according to Boundary Conditions
[ fidRVE ] = ReadRVEAdressFile( InputIndex );

%% Read the whole Multiscale Input Data File 
fidRVE  = fopen(fidRVE,'r'); 
textRVE = textscan(fidRVE,'%s','Delimiter','');
textRVE = textRVE{1};
fidRVE  = fclose(fidRVE);

%% Find the '$' and '$$' symbols in text 
[ InputMultiscaleIndex ] = Find2Dollar( textRVE );

%% Find the Microstructure Index of RVE
[ InputMultiscaleIndex ] = FindMicrostrucrureIndexRVE( i,textRVE,InputIndex,InputMultiscaleIndex );

%% Read the Nodes of RVE
[ InputMultiscaleIndex ] = ReadCoordinatesOfNodesRVE( i,textRVE,InputIndex,InputMultiscaleIndex );

%% Read the Element Connectivity of RVE
[ InputMultiscaleIndex ] = ReadConnectivityOfElementsRVE( i,textRVE,InputIndex,InputMultiscaleIndex );

%Convert connectivity to counter-clockwise order
[ InputMultiscaleIndex ]=Reorder_Connectivity(InputMultiscaleIndex);

%% Read the whole Input Data File 
fidCoarse  = InputIndex.InputAdressIndex            ;
fidCoarse  = fopen(fidCoarse,'r')                   ; 
textCoarse = textscan(fidCoarse,'%s','Delimiter','');
textCoarse = textCoarse{1}                          ;
fidCoarse  = fclose(fidCoarse)                      ;

%% Read the different kind of sections and material of RVE elements
[ InputIndex,InputMultiscaleIndex ] = ReadDiffKindSectionAndMaterialRVE( textCoarse,InputIndex,InputMultiscaleIndex );

%% Read the Bounded Nodes of RVE    
[ InputMultiscaleIndex ] = ReadBoundaryNodesRVE( i,textRVE,InputIndex,InputMultiscaleIndex );

%% Multiscale boundary condition
InputMultiscaleIndex.MultiscaleBoundaryConditionsIndex=InputIndex.AnalIndex.MultiscaleIndex(1,2);

%% Boundary conditions with full constrains ("on"=1 , "off"=0)
if InputIndex.AnalIndex.MultiscaleIndex(1,2)==3 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==4 %case Oversampling Linear / Periodic
    InputMultiscaleIndex.BoundaryConditionsFullConstrainsIndex=0; 
else
    InputMultiscaleIndex.BoundaryConditionsFullConstrainsIndex=1;
end

%% Number of Macro Nodes
%  Find a Coarse Element this microstructure corresponds to
aCoarseId = find( [Coarse(:).MicrostructureType]==i, 1, 'first' ) ;
InputMultiscaleIndex.NumberOfCoarseMacroNodes=Coarse(aCoarseId).nNodes;

%  Find Coarse Element Type
InputMultiscaleIndex.iType            =Coarse(aCoarseId).iType;
nDofsPerMacroNode                     =Coarse(aCoarseId).nDofsPerNode;
InputMultiscaleIndex.nDofsPerMacroNode=nDofsPerMacroNode;

%  Assign corresponding number of external "surfaces"
InputMultiscaleIndex.nSurfaces=Coarse(aCoarseId).nSurfaces;

%% Number of Macro Degree Of freedom
InputMultiscaleIndex.DegreeOfFreedomCoarseMacro=nDofsPerMacroNode*InputMultiscaleIndex.NumberOfCoarseMacroNodes;

%% -- Initialization - Gauss Integration Rule---------------------------------
InputMultiscaleIndex.NumberOfGaussPoints = InputIndex.NumberOfIntegPoints;
% ----------------------------------------------------------------------------

%% Number of Micro Degree Of freedom
InputMultiscaleIndex.DegreeOfFreedomCoarseMicro=nDofsPerMacroNode*InputMultiscaleIndex.NumberofNodes;

if InputIndex.AnalIndex.MultiscaleIndex(1,2)==3 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==4 %case Oversampling Linear/Periodic
    %% Number of Macro Nodes for oversampling
    InputMultiscaleIndex.NumberOfCoarseMacroNodesForOversampling=InputMultiscaleIndex.NumberOfCoarseMacroNodes;
    
    %% Number of Macro Degree Of freedom for oversampling
    InputMultiscaleIndex.DegreeOfFreedomCoarseMacroForOversampling=nDofsPerMacroNode*InputMultiscaleIndex.NumberOfCoarseMacroNodesForOversampling;
    
    %% Number of Micro Degree Of freedom for oversampling
    InputMultiscaleIndex.DegreeOfFreedomCoarseMicroForOversampling=nDofsPerMacroNode*InputMultiscaleIndex.NumberofNodesForOversampling;
end

%% Create RVE Finite Elements
[ Fem ] = CreateRVEFiniteElements( InputMultiscaleIndex );

%% Draw RVE Function
[ InputIndex ] = DrawRVEFunction( Fem,InputIndex,InputMultiscaleIndex );

%% Delete unused variables
field = 'Elements';
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,field);
end

