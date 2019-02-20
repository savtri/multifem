function DrawBasisFunctionsRVE( i,Fem,u,InputIndex,InputMultiscaleIndex,fid,figureID )
%% Visible Index
if InputIndex.DrawIndex.DrawBasisFunctionStructureRVEIndex(1,1)==0 %case no Visible
    figure('Visible','off')
else
    figure(figureID); %case Visible
end
hold on
%% Name the axis
xlabel('x Grid of Structure');
ylabel('y Grid of Structure');
%% Select case of macro degree of freedom
if i==1
    title('Deformed Shape From Basis Function: N1x (u1x=1)');
elseif i==2
    title('Deformed Shape From Basis Function: N1y (u1y=1)');
elseif i==3
    title('Deformed Shape From Basis Function: N2x (u2x=1)');
elseif i==4
    title('Deformed Shape From Basis Function: N2y (u2y=1)');
elseif i==5
    title('Deformed Shape From Basis Function: N3x (u3x=1)');
elseif i==6
    title('Deformed Shape From Basis Function: N3y (u3y=1)');
elseif i==7
    title('Deformed Shape From Basis Function: N4x (u4x=1)');
elseif i==8
    title('Deformed Shape From Basis Function: N4y (u4y=1)');
end
grey = [0.4 , 0.4 , 0.4];
%% Draw basis function of RVE
for n1=1:InputMultiscaleIndex.NumberOfElements
    %Displacement of each RVE element
    uLocal(1:2,1)=u(2*Fem(n1).NodeIndex(1,1)-1:2*Fem(n1).NodeIndex(1,1),1);
    uLocal(3:4,1)=u(2*Fem(n1).NodeIndex(1,2)-1:2*Fem(n1).NodeIndex(1,2),1);
    uLocal(5:6,1)=u(2*Fem(n1).NodeIndex(1,3)-1:2*Fem(n1).NodeIndex(1,3),1);
    uLocal(7:8,1)=u(2*Fem(n1).NodeIndex(1,4)-1:2*Fem(n1).NodeIndex(1,4),1);
    %Coords of undeformed RVE element
    XYZ0(1,1)=InputMultiscaleIndex.IndexXYNodes(Fem(n1).NodeIndex(1,1),2);
    XYZ0(1,2)=InputMultiscaleIndex.IndexXYNodes(Fem(n1).NodeIndex(1,2),2);
    XYZ0(1,3)=InputMultiscaleIndex.IndexXYNodes(Fem(n1).NodeIndex(1,3),2);
    XYZ0(1,4)=InputMultiscaleIndex.IndexXYNodes(Fem(n1).NodeIndex(1,4),2);
    XYZ0(2,1)=InputMultiscaleIndex.IndexXYNodes(Fem(n1).NodeIndex(1,1),3);
    XYZ0(2,2)=InputMultiscaleIndex.IndexXYNodes(Fem(n1).NodeIndex(1,2),3);
    XYZ0(2,3)=InputMultiscaleIndex.IndexXYNodes(Fem(n1).NodeIndex(1,3),3);
    XYZ0(2,4)=InputMultiscaleIndex.IndexXYNodes(Fem(n1).NodeIndex(1,4),3);
    %Coords of deformed RVE element
    XYZ(:,1)=XYZ0(:,1)+uLocal(1:2,1);
    XYZ(:,2)=XYZ0(:,2)+uLocal(3:4,1);
    XYZ(:,3)=XYZ0(:,3)+uLocal(5:6,1);
    XYZ(:,4)=XYZ0(:,4)+uLocal(7:8,1);
    %Find the centroid of RVE element (deformed)
    geom(2:3)=mean(XYZ');
    xCentroid=geom(2);
    yCentroid=geom(3);
    %Draw undeformed RVE element
    line([XYZ0(1,1);XYZ0(1,2)],[XYZ0(2,1);XYZ0(2,2)],'Color',grey);
    line([XYZ0(1,2);XYZ0(1,3)],[XYZ0(2,2);XYZ0(2,3)],'Color',grey);
    line([XYZ0(1,3);XYZ0(1,4)],[XYZ0(2,3);XYZ0(2,4)],'Color',grey);
    line([XYZ0(1,4);XYZ0(1,1)],[XYZ0(2,4);XYZ0(2,1)],'Color',grey);
    %Draw deformed RVE element
    line([XYZ(1,1);XYZ(1,2)],[XYZ(2,1);XYZ(2,2)],'Color','k','LineWidth',2);
    line([XYZ(1,2);XYZ(1,3)],[XYZ(2,2);XYZ(2,3)],'Color','k','LineWidth',2);
    line([XYZ(1,3);XYZ(1,4)],[XYZ(2,3);XYZ(2,4)],'Color','k','LineWidth',2);
    line([XYZ(1,4);XYZ(1,1)],[XYZ(2,4);XYZ(2,1)],'Color','k','LineWidth',2);
    %Draw Node Point Index
    for j=1:size(Fem(n1).NodeIndex,2)
        labels = cellstr( num2str([Fem(n1).NodeIndex(1,j)]') );  %' # labels correspond to their order
        plot(XYZ(1,j),XYZ(2,j), '.b','MarkerSize', 20)
        text(XYZ(1,j),XYZ(2,j), labels, 'VerticalAlignment','bottom',  'HorizontalAlignment','right')
    end    
    %Draw Centroid Point Index
    labels = cellstr( num2str([n1]') );  %' # labels correspond to their order
    plot(xCentroid,yCentroid, 'rx')
    text(xCentroid,yCentroid,labels,'VerticalAlignment','bottom',  'HorizontalAlignment','right');
end
axis equal
grid on
box on
%% Save Index
if InputIndex.DrawIndex.DrawBasisFunctionStructureRVEIndex(1,2)==1 %case Save
    saveas(gcf,fid,'png')
end
end

