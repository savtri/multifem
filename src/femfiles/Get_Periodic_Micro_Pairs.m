function PeriodicPairs=Get_Periodic_Micro_Pairs(InputMultiscaleIndex,MicroBoundaryTotalNodes)

iType=InputMultiscaleIndex.iType;

switch iType
    case 1
        nSurf=4;
        nPerSurf=nSurf/2;
        theSurf(1,1)=1;
        theSurf(2,1)=2;
    case 11
        nSurf=6;
        nPerSurf=nSurf/2;
        theSurf(1,1)=1;
        theSurf(2,1)=3;
        theSurf(3,1)=5;        
end

%Then cycle through the internal boundary nodes
h=0;
for iSurf=1:nPerSurf
   thePeriodicSurface=Get_Periodic_Surface(theSurf(iSurf),iType);      
   for inode1=1:size(MicroBoundaryTotalNodes,2)
      mindist=99999999999999999;
      index1=find(InputMultiscaleIndex.IndexXYNodes(:,1)==MicroBoundaryTotalNodes(theSurf(iSurf),inode1));      
      XYZ1=InputMultiscaleIndex.IndexXYNodes(index1,2:4);      
      for inode2=1:size(MicroBoundaryTotalNodes,2)
        index2=find(InputMultiscaleIndex.IndexXYNodes(:,1)==MicroBoundaryTotalNodes(thePeriodicSurface,inode2));
        XYZ2=InputMultiscaleIndex.IndexXYNodes(index2,2:4);        
        dist=norm(XYZ1-XYZ2,2);
        if dist<mindist
            mindist=dist;
            minnod=MicroBoundaryTotalNodes(thePeriodicSurface,inode2);
        end                        
      end
      h=h+1;
      PeriodicPairs(h,1)=MicroBoundaryTotalNodes(theSurf(iSurf),inode1);
      PeriodicPairs(h,2)=minnod;
   end      
end


end


