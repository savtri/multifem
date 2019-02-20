function [ AppliedDisplacements ] = AppliedDisplacementsRVEOversamplingLinear2( i,InputIndex,InputMultiscaleIndex )
Fxx=InputMultiscaleIndex.Fxx;
Fyy=InputMultiscaleIndex.Fyy;
n1=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(1,1);
n2=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(2,1);
n3=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(3,1);
n4=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(4,1);
M1=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1);
M2=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1);
M3=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1);
M4=InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1);
if i==1 || i==2
   k=1; 
elseif i==3 || i==4
   k=2;
elseif i==5 || i==6    
   k=3;   
elseif i==7 || i==8
   k=4;
end
h=1;
for j=1:InputMultiscaleIndex.NumberOfBoundedNodesRVE
    m=InputMultiscaleIndex.IndexXYMicroBoundaryNodes(j,1);
    if m~=M1 && m~=M2 && m~=M3 && m~=M4
        if i==1 || i==3 || i==5 || i==7 
            AppliedDisplacements(h,1)=Fxx(j,k);
        elseif i==2 || i==4 || i==6 || i==8
            AppliedDisplacements(h,1)=Fyy(j,k);
        end
        h=h+1;
    end
end
%In case there is somewhere zero in Matrix
for j=1:size(AppliedDisplacements,1)
   if  AppliedDisplacements(j,1)==0
       AppliedDisplacements(j,1)=0.00000001;
   end
end
end

