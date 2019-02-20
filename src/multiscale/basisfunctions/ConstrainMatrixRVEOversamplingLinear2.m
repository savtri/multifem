function [ Constrains ] = ConstrainMatrixRVEOversamplingLinear2( i,InputMultiscaleIndex )
Constrains=ones(InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,1);
n1=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(1,1);
n2=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(2,1);
n3=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(3,1);
n4=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(4,1);
if i==1 || i==3 || i==5 || i==7
    %Constrains in all y directions
    for j=1:InputMultiscaleIndex.NumberOfBoundedNodesRVE
        c(j,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(j,1);
    end
elseif i==2 || i==4 || i==6 || i==8
    %Constrains in all x directions
    for j=1:InputMultiscaleIndex.NumberOfBoundedNodesRVE
        c(j,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(j,1)-1;
    end   
end
if i==1
    c(j+1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1)-1;
    c(j+2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1)-1;
    c(j+3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1)-1;
elseif i==2    
    c(j+1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1);
    c(j+2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1);
    c(j+3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1);
elseif i==3
    c(j+1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1)-1;
    c(j+2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1)-1;
    c(j+3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1)-1;
elseif i==4    
    c(j+1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1);
    c(j+2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1);
    c(j+3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1);
elseif i==5
    c(j+1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1)-1;
    c(j+2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1)-1;
    c(j+3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1)-1;
elseif i==6    
    c(j+1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1);
    c(j+2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1);
    c(j+3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1);
elseif i==7
    c(j+1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1)-1;
    c(j+2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1)-1;
    c(j+3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1)-1;
elseif i==8    
    c(j+1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1);
    c(j+2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1);
    c(j+3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1);
end
for j=1:size(c,1)
    Constrains(c(j,1))=0;
end
end

