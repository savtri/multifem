function DrawMicrostructures2D( VisibleIndex,SaveIndex,Coarse,InputIndex,fid,figureID )
%% Visible Index
if VisibleIndex==0 %case no Visible
    figure('Visible','off')
else %case Visible
    figure(figureID);
end
%Number of Different Microstructure of Coarse Elements
NumberOfMicrostructures=InputIndex.NumberOfMicrostructures;
%Assign the colors for each section
cmap = hsv(NumberOfMicrostructures);
hold on
%% Draw Initial Sections of Structure
for i=1:InputIndex.NumberOfElements %Loop over elements
    NodeIndex=Coarse(i).NodeIndex(1,:); %Define element connectivity
    XYZ=zeros(2,size(NodeIndex,2)); %Define element coords
    %Assign element coords
    XYZ=Get_Element_Coords(InputIndex.IndexXY,NodeIndex,1);                
    %Draw Lines
    for j=1:size(NodeIndex,2)-1 
        line([XYZ(1,j);XYZ(1,j+1)],[XYZ(2,j);XYZ(2,j+1)],'Color','k','LineWidth',2);
    end
    %Draw close Line
    line([XYZ(1,j+1);XYZ(1,1)],[XYZ(2,j+1);XYZ(2,1)],'Color','k','LineWidth',2);
    %Draw patches
    p=patch(XYZ(1,:),XYZ(2,:),[cmap(Coarse(i).MicrostructureType,:)]);
end
axis equal
grid on
box on
%% Save Index
if SaveIndex==1 %case Save
    saveas(gcf,fid,'png')
end
end

