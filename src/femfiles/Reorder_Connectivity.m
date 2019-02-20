function anIndex=Reorder_Connectivity(anIndex)

Elements=anIndex.Elements;

for ielem=1:anIndex.NumberOfElements
  switch Elements(ielem,2) %Based on Element Type
      case 1 %Plane Stress Elements
        Nodes=Elements(ielem,3:6)';
        Coords=anIndex.IndexXYNodes(Nodes,2:3);
        theNodes=[Nodes Coords];
        theRenNodes=ReOrder_Quad_Nodes(theNodes);        
        anIndex.Elements(ielem,3:6)=theRenNodes(:,1)'; 
      case 11 %Hex-solids
        Nodes=Elements(ielem,3:10)';
        Coords=anIndex.IndexXYNodes(Nodes,2:4);
        theNodes=[Nodes Coords];
        theRenNodes=ReOrder_Hex_Nodes(theNodes);        
        anIndex.Elements(ielem,3:10)=theRenNodes(:,1)';
  end
  
end

end