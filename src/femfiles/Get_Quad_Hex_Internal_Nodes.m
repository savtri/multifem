function [NumberOfMicroBoundaryInternalNodes, MicroBoundaryInternalNodes,TotalNodes] = Get_Quad_Hex_Internal_Nodes(InputMultiscaleIndex)


%This function returns the bounded node topology of Hex Coarse Elements

N=zeros(6,1);

theMnodes=InputMultiscaleIndex.IndexXYMacroBoundaryNodes;
theRenNodes=ReOrder_Hex_Nodes(theMnodes);        

for iSurf=1:6
    endNodes=Get_Surf_Mnodes(11,iSurf);
    theSurfnodes=theRenNodes(endNodes,:);
            
    %cycle through all bounded nodes. Check which are coplanar with Coarse
    %Element surfaces - Only 3 points are required to define the surface
    X=zeros(3,1); Y=zeros(3,1); Z=zeros(3,1);
    X(1:3)=theSurfnodes(1:3,2);
    Y(1:3)=theSurfnodes(1:3,3);
    Z(1:3)=theSurfnodes(1:3,4);
    
    PlaneCoords=[X Y Z];
    
    c=mean(PlaneCoords);
    NormalV=null(bsxfun(@minus, PlaneCoords,c));
    NormalV=mean(NormalV,2); 
    %
    i=0;
    for ibnod=1:InputMultiscaleIndex.NumberOfBoundedNodesRVE     
        icase1=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,1) ... 
         ~= theRenNodes(endNodes(1,1),1);
     
        icase2=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,1) ... 
         ~= theRenNodes(endNodes(1,2),1);
     
        icase3=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,1) ... 
         ~= theRenNodes(endNodes(1,3),1);
     
        icase4=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,1) ... 
         ~= theRenNodes(endNodes(1,4),1);
        
        
       if icase1 && icase2 && icase3 && icase4
          X(4)=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,2);
          Y(4)=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,3);
          Z(4)=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,4);
          PointCart=[X(4) Y(4) Z(4)];
          distance=abs(dot(NormalV,c-PointCart));                              
          if abs(distance)<1.0e-5 %then coplanar
             N(iSurf,1)=N(iSurf,1)+1;
             i=i+1;
             nodes(iSurf,i)=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(ibnod,1);
          end  
       end        
    end
    %CST To be tested for 3D elements
    nsize=size(theSurfnodes(:,1)',2);
    TotalNodes(iSurf,1:nsize)=theSurfnodes(:,1)';    
    TotalNodes(iSurf,5:4+N(iSurf,1))= nodes(iSurf,:);    
end

NumberOfMicroBoundaryInternalNodes=N;
MicroBoundaryInternalNodes=nodes;

end