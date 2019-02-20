function RenNodes=ReOrder_Hex_Nodes(theNodes)
%Renumber hex-element nodes in counter-clockwise order

nNodes=size(theNodes,1);
Nodes=zeros(size(theNodes));
%
theCentroid=centroid(theNodes(:,2:4));
%
inum_point=zeros(nNodes,1);
for inode=1:nNodes
   dx=theNodes(inode,2)-theCentroid(1,1);
   dy=theNodes(inode,3)-theCentroid(1,2);
   dz=theNodes(inode,4)-theCentroid(1,3);

   if dx<0 && dy<0 && dz<0    
    inum_point(inode,1)=1;
   elseif dx>0.0 && dy<0 && dz<0  
    inum_point(inode)=2;
   elseif dx>0.0 && dy>0 && dz<0  
    inum_point(inode)=3;
   elseif dx<0.0 && dy>0 && dz<0  
    inum_point(inode)=4;
   elseif dx<0.0 && dy<0 && dz>0  
    inum_point(inode)=5;
   elseif dx>0.0 && dy<0 && dz>0  
    inum_point(inode)=6;
   elseif dx>0.0 && dy>0 && dz>0  
    inum_point(inode)=7;
   elseif dx<0.0 && dy>0 && dz>0  
    inum_point(inode)=8;
   end   
end

for inod=1:nNodes    
    RenNodes(inum_point(inod),:)=theNodes(inod,:);    
end

end