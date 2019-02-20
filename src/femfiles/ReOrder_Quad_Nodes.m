function RenNodes=ReOrder_Quad_Nodes(theNodes)
%Renumber quad-element nodes in counter-clockwise order

nNodes=size(theNodes,1);
Nodes=zeros(size(theNodes));
%
theCentroid=centroid(theNodes(:,2:3));
%
inum_point=zeros(nNodes,1);
for inode=1:nNodes
   dx=theNodes(inode,2)-theCentroid(1,1);
   dy=theNodes(inode,3)-theCentroid(1,2);   

   if dx<0 && dy<0
    inum_point(inode,1)=1;
   elseif dx>0.0 && dy<0
    inum_point(inode)=2;
   elseif dx>0.0 && dy>0
    inum_point(inode)=3;
   elseif dx<0.0 && dy>0
    inum_point(inode)=4;   
   end   
end
%
[n, bin] = histc(inum_point, unique(inum_point));
multiple = find(n > 1);
index    = find(ismember(bin, multiple));
%
if isempty(index)==1
    for inod=1:nNodes    
        RenNodes(inum_point(inod),:)=theNodes(inod,:);    
    end
else
   %Bad Geometry, leave with intitial 
   RenNodes=theNodes;
end

end