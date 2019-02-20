function [ AssembyMatrix ] = AssembyMatrixRVEOversamplingLinear2( i,NumberOfKinematicDescriptions,InputMultiscaleIndex )
AssembyMatrix=zeros(NumberOfKinematicDescriptions,2);
n1=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(1,1);
n2=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(2,1);
n3=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(3,1);
n4=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(4,1);
M1=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1);
M2=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1);
M3=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1);
M4=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1);
h=1;
for j=1:InputMultiscaleIndex.NumberOfBoundedNodesRVE
    m=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(j,1);
    if m~=M1 && m~=M2 && m~=M3 && m~=M4
        if i==1 || i==3 || i==5 || i==7 
            AssembyMatrix(h,2)=2*m-1;
        elseif i==2 || i==4 || i==6 || i==8
            AssembyMatrix(h,2)=2*m;
        end
        h=h+1;
    end
end
if i==1
    AssembyMatrix(:,1)=2*M1-1;
elseif i==2    
    AssembyMatrix(:,1)=2*M1;
elseif i==3
    AssembyMatrix(:,1)=2*M2-1;
elseif i==4
    AssembyMatrix(:,1)=2*M2;
elseif i==5
    AssembyMatrix(:,1)=2*M3-1;
elseif i==6
    AssembyMatrix(:,1)=2*M3;
elseif i==7
    AssembyMatrix(:,1)=2*M4-1;
elseif i==8    
    AssembyMatrix(:,1)=2*M4;
end
end

