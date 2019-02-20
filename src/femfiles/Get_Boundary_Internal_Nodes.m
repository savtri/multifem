function [NumberOfMicroBoundaryInternalNodes, MicroBoundaryInternalNodes,TotalNodes] = Get_Boundary_Internal_Nodes(InputMultiscaleIndex)

switch InputMultiscaleIndex.iType
    case 1 %Quadrilateral Coarse Element
         [NumberOfMicroBoundaryInternalNodes, MicroBoundaryInternalNodes,TotalNodes] = Get_Quad_Bound_Internal_Nodes(InputMultiscaleIndex);
    case 11 %Hex Coarse Element
         [NumberOfMicroBoundaryInternalNodes, MicroBoundaryInternalNodes,TotalNodes] = Get_Quad_Hex_Internal_Nodes(InputMultiscaleIndex);
end



end