function DrawSolid(i,XYZ,NodeIndex,xCentroid,yCentroid,zCentroid,ifill,cmap,imap)

%% Draw first 4 edges
    for j=1:3
        line([XYZ(1,j);XYZ(1,j+1)],[XYZ(2,j);XYZ(2,j+1)],[XYZ(3,j);XYZ(3,j+1)],'Color','k','LineWidth',2);
    end
    %Draw close Line
    line([XYZ(1,j+1);XYZ(1,1)],[XYZ(2,j+1);XYZ(2,1)],[XYZ(3,j+1);XYZ(3,1)],'Color','k','LineWidth',2);    
    %% Draw Next 4 edges
    for j=5:7
        line([XYZ(1,j);XYZ(1,j+1)],[XYZ(2,j);XYZ(2,j+1)],[XYZ(3,j);XYZ(3,j+1)],'Color','k','LineWidth',2);
    end
    %Draw close Line
    line([XYZ(1,j+1);XYZ(1,5)],[XYZ(2,j+1);XYZ(2,5)],[XYZ(3,j+1);XYZ(3,5)],'Color','k','LineWidth',2);    
    %% Draw Final 4 edges
    line([XYZ(1,1);XYZ(1,5)],[XYZ(2,1);XYZ(2,5)],[XYZ(3,1);XYZ(3,5)],'Color','k','LineWidth',2);    
    line([XYZ(1,4);XYZ(1,8)],[XYZ(2,4);XYZ(2,8)],[XYZ(3,4);XYZ(3,8)],'Color','k','LineWidth',2);    
    line([XYZ(1,2);XYZ(1,6)],[XYZ(2,2);XYZ(2,6)],[XYZ(3,2);XYZ(3,6)],'Color','k','LineWidth',2);    
    line([XYZ(1,3);XYZ(1,7)],[XYZ(2,3);XYZ(2,7)],[XYZ(3,3);XYZ(3,7)],'Color','k','LineWidth',2);    
    
    %% Draw patches
    switch ifill
        case 1
            
            p1=patch(XYZ(1,1:4),XYZ(2,1:4),XYZ(3,1:4),[cmap(imap,:)]);
            p2=patch(XYZ(1,5:8),XYZ(2,5:8),XYZ(3,5:8),[cmap(imap,:)]);
            p3=patch([XYZ(1,1),XYZ(1,5),XYZ(1,8),XYZ(1,4)],[XYZ(2,1),XYZ(2,5),XYZ(2,8),XYZ(2,4)],[XYZ(3,1),XYZ(3,5),XYZ(3,8),XYZ(3,4)],[cmap(imap,:)]);
            p4=patch([XYZ(1,2),XYZ(1,3),XYZ(1,7),XYZ(1,6)],[XYZ(2,2),XYZ(2,3),XYZ(2,7),XYZ(2,6)],[XYZ(3,2),XYZ(3,3),XYZ(3,7),XYZ(3,6)],[cmap(imap,:)]);
            p5=patch([XYZ(1,3),XYZ(1,4),XYZ(1,8),XYZ(1,7)],[XYZ(2,3),XYZ(2,4),XYZ(2,8),XYZ(2,7)],[XYZ(3,2),XYZ(3,3),XYZ(3,7),XYZ(3,6)],[cmap(imap,:)]);
            p6=patch([XYZ(1,1),XYZ(1,2),XYZ(1,6),XYZ(1,5)],[XYZ(2,1),XYZ(2,2),XYZ(2,6),XYZ(2,5)],[XYZ(3,1),XYZ(3,2),XYZ(3,6),XYZ(3,5)],[cmap(imap,:)]);
    end
        
    %Draw Node Point Index
    for j=1:size(NodeIndex,2)
        labels = cellstr( num2str([NodeIndex(1,j)]') );
        plot3(XYZ(1,j),XYZ(2,j),XYZ(3,j), '.b','MarkerSize', 20)
        text(XYZ(1,j),XYZ(2,j),XYZ(3,j), labels, 'VerticalAlignment','bottom',  'HorizontalAlignment','right')
    end
    %Draw Centroid Point Index
    labels = cellstr( num2str([i]') );
    plot3(xCentroid(1), yCentroid(1),zCentroid(1), 'rx')
    text(xCentroid(1), yCentroid(1),zCentroid(1), labels, 'VerticalAlignment','bottom',  'HorizontalAlignment','right');
    
end