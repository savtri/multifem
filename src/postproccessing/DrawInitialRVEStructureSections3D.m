function DrawInitialRVEStructureSections3D( VisibleIndex,SaveIndex,Fem,InputIndex,InputMultiscaleIndex,fid,figureID )
%% Visible Index
if VisibleIndex==0 %case no Visible
    figure('Visible','off')
else %case Visible
    figure(figureID);
end
%% Draw Initial Structure Section of RVE
NumberOfDSections=max(InputMultiscaleIndex.Elements(:,7));
cmap = hsv(NumberOfDSections);
hold on
for i=1:InputMultiscaleIndex.NumberOfElements
    NodeIndex=Fem(i).NodeIndex(1,:); %Define element connectivity
    XYZ=zeros(3,size(NodeIndex,2)); %Define element coords            
    theNodes=InputMultiscaleIndex.IndexXYNodes(NodeIndex,:);    
    %Make Sure that connectivity is counter-clockwise
    theNodes=ReOrder_Hex_Nodes(theNodes);  
    NodeIndex=theNodes(:,1)';
    %
    XYZ=zeros(3,size(NodeIndex,2)); %Define element coords
    %Assign element coords
    XYZ=Get_Element_Coords(InputMultiscaleIndex.IndexXYNodes,Fem(i).NodeIndex,11);                     
    %Centroid
    geom(2:4)=mean(XYZ');    
    %% Draw Solid
    DrawSolid(i,XYZ,NodeIndex,geom(2),geom(3),geom(4),1,cmap,InputMultiscaleIndex.Elements(i,7))            
    
end
axis equal
grid on
box on
%% Save Index
if SaveIndex==1 %case Save
    saveas(gcf,fid,'png')
end
end

