function [N,nodes,TotalNodes]=Get_Quad_Bound_Internal_Nodes(InputMultiscaleIndex)
%This function returns the bounded node topology of Quad Coarse Elements
%
N=zeros(4,1);
%
theMnodes=InputMultiscaleIndex.IndexXYMacroBoundaryNodes;
theRenNodes=ReOrder_Quad_Nodes(theMnodes);        

for iSurf=1:4
    endNodes=Get_Surf_Mnodes(1,iSurf);
    theSurfnodes=theRenNodes(endNodes,:);
            
    %cycle through all bounded nodes. Check which are coplanar with Coarse
    %Element surfaces - Only 3 points are required to define the surface
    X=zeros(3,1); Y=zeros(3,1);
    X(1:2)=theSurfnodes(1:2,2);
    Y(1:2)=theSurfnodes(1:2,3);               
    %
    i=0;
    for ibnod=1:InputMultiscaleIndex.NumberOfBoundedNodesRVE     
        icase1=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,1) ... 
         ~= theRenNodes(endNodes(1,1),1);
     
        icase2=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,1) ... 
         ~= theRenNodes(endNodes(1,2),1);
                 
       if icase1 && icase2 
          X(3)=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,2);
          Y(3)=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,3);
          
          theDet=det([X(1)-X(3) Y(1)-Y(3);X(2)-X(3) Y(2)-Y(3)]);
          
          if abs(theDet)<1.0e-5 %then colinear
             N(iSurf,1)=N(iSurf,1)+1;
             i=i+1;
             nodes(iSurf,i)=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,1);
          end  
       end       
    end
    
    if N(iSurf,1)>0    
        TotalNodes(iSurf,1)=theSurfnodes(1,1);
        TotalNodes(iSurf,2:N(iSurf,1)+1)= nodes(iSurf,:);
        TotalNodes(iSurf,N(iSurf,1)+2)=theSurfnodes(2,1);
        NumberOfMicroBoundaryInternalNodes=N;
        MicroBoundaryInternalNodes=nodes;
    else
        nodes=[];
        MicroBoundaryInternalNodes=[];
        NumberOfMicroBoundaryInternalNodes=0;
        TotalNodes(iSurf,1)=theSurfnodes(1,1);
        TotalNodes(iSurf,2)=theSurfnodes(2,1);
    end
end




end