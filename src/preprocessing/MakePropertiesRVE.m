function [ InputIndex,InputMultiscaleIndex ] = MakePropertiesRVE( InputIndex,InputMultiscaleIndex )

%% Find the Macro nodes of RVE
nDim        = InputIndex.nDim                                             ;
K           = convhulln(InputMultiscaleIndex.IndexXYNodes(:,2:nDim+1));
K=unique(K);

nMacroNodes = InputMultiscaleIndex.NumberOfCoarseMacroNodes               ;
InputMultiscaleIndex.IndexXYMacroBoundaryNodes = zeros(nMacroNodes,3)     ;

for icoord=1:nDim+1
    InputMultiscaleIndex.IndexXYMacroBoundaryNodes(:,icoord)=InputMultiscaleIndex.IndexXYNodes(K(1:nMacroNodes),icoord);
end
%Make sure the nodes are in counter-clockwise order
theMnodes=InputMultiscaleIndex.IndexXYMacroBoundaryNodes;
switch InputMultiscaleIndex.iType
    case 1 %Q4        
        theRenNodes=ReOrder_Quad_Nodes(theMnodes);        
    case 11 %Hex
        theRenNodes=ReOrder_Hex_Nodes(theMnodes);        
end
InputMultiscaleIndex.IndexXYMacroBoundaryNodes=theRenNodes;
%% Find the micro boundary nodes of RVE
InputMultiscaleIndex.IndexXYMicroBoundaryNodes(:,1)=InputMultiscaleIndex.BoundedNodes;
InputMultiscaleIndex.NumberOfBoundedNodesRVE=InputMultiscaleIndex.NumberOfBoundedNodesRVE;
%% Assign the coords of micro boundary nodes of RVE
for i=1:InputMultiscaleIndex.NumberOfBoundedNodesRVE
    for j=1:InputMultiscaleIndex.NumberofNodes        
        if InputMultiscaleIndex.IndexXYMicroBoundaryNodes(i,1)==InputMultiscaleIndex.IndexXYNodes(j,1)
            for i1=2:nDim+1
                InputMultiscaleIndex.IndexXYMicroBoundaryNodes(i,i1)=InputMultiscaleIndex.IndexXYNodes(j,i1); 
            end
        end
	end
end
%% Find the Number of micro boundary internal nodes of RVE in each surface 1,2,3,4
nSurfaces=InputMultiscaleIndex.nSurfaces;

% InputMultiscaleIndex.IndexXYMacroBoundaryNodes are always
% counter-clockwise as they are derived from convhull

[NumberOfMicroBoundaryInternalNodes, MicroBoundaryInternalNodes,MicroBoundaryTotalNodes] = Get_Boundary_Internal_Nodes(InputMultiscaleIndex);
InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes = NumberOfMicroBoundaryInternalNodes;
InputMultiscaleIndex.MicroBoundaryInternalNodes         = MicroBoundaryInternalNodes;
InputMultiscaleIndex.MicroBoundaryTotalNodes            = MicroBoundaryTotalNodes;


%Now build the vector containing the boundary nodes that each Macro node "sees"
InputMultiscaleIndex.Macro2InternalMapping=zeros(InputMultiscaleIndex.NumberOfCoarseMacroNodes,1);
for iMnod=1:InputMultiscaleIndex.NumberOfCoarseMacroNodes
   [aSurf, nSurf] = Get_Nodal_Surfaces(InputMultiscaleIndex.iType,iMnod);   
   inew=1;
   for iSurf=1:nSurf
    imnode=1;   
    while imnode<=size(MicroBoundaryInternalNodes,2)
        if MicroBoundaryInternalNodes(iSurf,imnode)>0
            aNewnode=MicroBoundaryInternalNodes(aSurf(iSurf),imnode);
            icheck=find(InputMultiscaleIndex.Macro2InternalMapping(iMnod,:)==aNewnode);
            if isempty(icheck)
                InputMultiscaleIndex.Macro2InternalMapping(iMnod,inew)=aNewnode;
                inew=inew+1;
            end                    
            imnode=imnode+1;
        else
            break;
        end
    end                  
   end      
end

%% Finally Build the "periodic node" array
ibc_case=InputIndex.AnalIndex.MultiscaleIndex(1,2);
if ibc_case ~=1
    InputMultiscaleIndex.PeriodicPairs=Get_Periodic_Micro_Pairs(InputMultiscaleIndex,MicroBoundaryTotalNodes);
end



%% Delete 'BoundedNodes' field
field = 'BoundedNodes';
InputMultiscaleIndex = rmfield(InputMultiscaleIndex,field);

%% Plot Coarse Boundary (uncomment to check the RVE boundary)
%plot(InputMultiscaleIndex.IndexXYNodes(K,2),InputMultiscaleIndex.IndexXYNodes(K,3),'r-',InputMultiscaleIndex.IndexXYNodes(:,2),InputMultiscaleIndex.IndexXYNodes(:,3),'b*')
end

