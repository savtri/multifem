function [ Ggen ] = GIMatrix( R,Fem,InputIndex,InputMultiscaleIndex )
% Make G Matrices  
for i=1:InputMultiscaleIndex.NumberOfElements
    nMicroNodes=Fem(i).nNodes;                          % Number of micro Nodes of EACH Fine FE
    h=1;
    for j = 1:nMicroNodes
        sizeR               = size(R{Fem(i).NodeIndex(1,j)},1);
        Ggen{i}(h:h+sizeR-1,:) = [R{Fem(i).NodeIndex(1,j)}];
        h                   = h + sizeR;
    end
end            


end

