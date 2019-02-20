function DrawInitialRVEStructure3D( VisibleIndex,SaveIndex,Fem,InputMultiscaleIndex,fid,figureID )
%% Visible Index
if VisibleIndex==0 %case no Visible
    figure('Visible','off')
else %case Visible
    figure(figureID); 
end
%% Draw Initial Structure of RVE
hold on
for i=1:InputMultiscaleIndex.NumberOfElements
    NodeIndex=Fem(i).NodeIndex(1,:); %Define element connectivity
    theNodes=InputMultiscaleIndex.IndexXYNodes(NodeIndex,:);
    
    %Make Sure that connectivity is counter-clockwise
    theNodes=ReOrder_Hex_Nodes(theNodes);  
    NodeIndex=theNodes(:,1)';
    %
    XYZ=zeros(3,size(NodeIndex,2)); %Define element coords
    %Assign element coords   
    XYZ=Get_Element_Coords(InputMultiscaleIndex.IndexXYNodes,Fem(i).NodeIndex,11);            
    %Find the centroid point of coarse element
    geom(2:4)=mean(XYZ');
    InputMultiscaleIndex.xCentroid(i,1)=geom(2);
    InputMultiscaleIndex.yCentroid(i,1)=geom(3); 
    InputMultiscaleIndex.zCentroid(i,1)=geom(4); 
    
    DrawSolid(i,XYZ,NodeIndex,InputMultiscaleIndex.xCentroid(i,1),InputMultiscaleIndex.yCentroid(i,1),InputMultiscaleIndex.zCentroid(i,1),0,[],[])
end
axis equal
grid on
box on
view(3)
%% Save Index
if SaveIndex==1 %cace Save
    saveas(gcf,fid,'png')
end
end

