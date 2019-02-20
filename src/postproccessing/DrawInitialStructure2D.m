function DrawInitialStructure2D(  VisibleIndex,SaveIndex,Coarse,InputIndex,fid,figureID )
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
    XYZ=zeros(2,size(NodeIndex,2)); %Define element coords
    %Assign element coords
    XYZ=Get_Element_Coords(InputIndex.IndexXYNodes,NodeIndex,1);                    
    %Find the centroid point of coarse element
    geom(2:3)=mean(XYZ');
    InputIndex.xCentroid(i,1)=geom(2);
    InputIndex.yCentroid(i,1)=geom(3); 
    %Draw Lines
    for j=1:size(NodeIndex,2)-1 
        line([XYZ(1,j);XYZ(1,j+1)],[XYZ(2,j);XYZ(2,j+1)],'Color','k','LineWidth',2);
    end
    %Draw close Line
    line([XYZ(1,j+1);XYZ(1,1)],[XYZ(2,j+1);XYZ(2,1)],'Color','k','LineWidth',2);
    %Draw Node Point Index
    for j=1:size(NodeIndex,2)
        labels = cellstr( num2str([NodeIndex(1,j)]') );
        plot(XYZ(1,j),XYZ(2,j), '.b','MarkerSize', 20)
        text(XYZ(1,j),XYZ(2,j), labels, 'VerticalAlignment','bottom',  'HorizontalAlignment','right')
    end
    %Draw Centroid Point Index
    labels = cellstr( num2str([i]') );
    plot(InputIndex.xCentroid(i,1), InputIndex.yCentroid(i,1), 'rx')
    text(InputIndex.xCentroid(i,1), InputIndex.yCentroid(i,1), labels, 'VerticalAlignment','bottom',  'HorizontalAlignment','right');
end
axis equal
grid on
box on
%% Save Index
if SaveIndex==1 %case Save
    saveas(gcf,fid,'png')
end
end

