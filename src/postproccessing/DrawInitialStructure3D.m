function DrawInitialStructure3D(  VisibleIndex,SaveIndex,Coarse,InputIndex,fid,figureID )
%% Visible Index
if VisibleIndex==0 %case no Visible
    figure('Visible','off')
else %case Visible
    figure(figureID);
end
%% Draw Initial Structure
hold on
for i=1:InputIndex.NumberOfElements %Loop over elements
    NodeIndex=Coarse(i).NodeIndex(1,:); %Define element connectivity
    theNodes=InputIndex.IndexXYNodes(NodeIndex,:);
    
    %Make Sure that connectivity is counter-clockwise
    theNodes=ReOrder_Hex_Nodes(theNodes);  
    NodeIndex=theNodes(:,1)';
    %
    XYZ=zeros(3,size(NodeIndex,2)); %Define element coords
    %Assign element coords
    XYZ=Get_Element_Coords(InputIndex.IndexXYNodes,NodeIndex,11);                
    %Find the centroid point of coarse element
    geom(2:4)=mean(XYZ');
    InputIndex.xCentroid(i,1)=geom(2);
    InputIndex.yCentroid(i,1)=geom(3); 
    InputIndex.zCentroid(i,1)=geom(4); 
    
    DrawSolid(i,XYZ,NodeIndex,InputIndex.xCentroid(i,1),InputIndex.yCentroid(i,1),InputIndex.zCentroid(i,1),0,[],[])
    
end
axis equal
grid on
box on
view(3)
%% Save Index
if SaveIndex==1 %case Save
    saveas(gcf,fid,'png')
end
end

