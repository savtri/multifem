function [ Fem,InputIndex,InputMultiscaleIndex ] = RedefinitionDueToOversamplingRVE2( InputIndex,InputMultiscaleIndex )
%% Redefinition without oversampling
InputMultiscaleIndex.DegreeOfFreedomCoarseMicro=InputMultiscaleIndex.DegreeOfFreedomCoarseMicroForOversampling;
InputMultiscaleIndex.BoundedNodes=InputMultiscaleIndex.BoundedNodesForOversampling;
InputMultiscaleIndex.IndexXYMacroBoundaryNodes=InputMultiscaleIndex.IndexXYMacroBoundaryNodesForOversampling;
InputMultiscaleIndex.IndexXYMicroBoundaryNodes=InputMultiscaleIndex.IndexXYMicroBoundaryNodesForOversampling;
InputMultiscaleIndex.NumberofNodes=InputMultiscaleIndex.NumberofNodesForOversampling;  
InputMultiscaleIndex.NumberOfElements=InputMultiscaleIndex.NumberOfElementsForOversampling;
InputMultiscaleIndex.IndexXYNodes=InputMultiscaleIndex.IndexXYNodesForOversampling;
InputMultiscaleIndex.NumberOfDifferentSections=InputMultiscaleIndex.NumberOfDifferentSectionsForOversampling;
InputMultiscaleIndex.E=InputMultiscaleIndex.EForOversampling;
InputMultiscaleIndex.v=InputMultiscaleIndex.vForOversampling;

InputMultiscaleIndex.thickness=InputMultiscaleIndex.thicknessForOversampling;
InputMultiscaleIndex.Elements=InputMultiscaleIndex.ElementsForOversampling;
InputMultiscaleIndex.NumberOfBoundedNodesRVE=InputMultiscaleIndex.NumberOfBoundedNodesRVEForOversampling;
InputMultiscaleIndex.NumberOfCoarseMacroNodes=InputMultiscaleIndex.NumberOfCoarseMacroNodesForOversampling;
InputMultiscaleIndex.DegreeOfFreedomCoarseMacro=InputMultiscaleIndex.DegreeOfFreedomCoarseMacroForOversampling;
InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodesForOversampling;
if InputIndex.AnalIndex.MultiscaleIndex(1,2)==3;
    InputIndex.AnalIndex.MultiscaleIndex(1,2)=32;
elseif InputIndex.AnalIndex.MultiscaleIndex(1,2)==4;
    InputIndex.AnalIndex.MultiscaleIndex(1,2)=42;
end
%% Delete unused fields
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'DegreeOfFreedomCoarseMicroForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'BoundedNodesForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'IndexXYMacroBoundaryNodesForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'IndexXYMicroBoundaryNodesForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'NumberofNodesForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'NumberOfElementsForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'IndexXYNodesForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'NumberOfDifferentSectionsForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'EForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'vForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'BoundedNodesGlobalForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'thicknessForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'ElementsForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'NumberOfBoundedNodesRVEForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'NumberOfCoarseMacroNodesForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'DegreeOfFreedomCoarseMacroForOversampling');
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,'NumberOfMicroBoundaryInternalNodesForOversampling');
Fem=[];

%% Create RVE Finite Elements
[ Fem ] = CreateRVEFiniteElements( InputMultiscaleIndex );

%% Draw RVE Function
%DrawRVEFunction1(InputIndex,InputMultiscaleIndex);

%% Delete unused fields
field = 'Elements';
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,field);
end

