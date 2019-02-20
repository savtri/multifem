function [ AppliedDisplacements ] = AppliedDisplacementsRVEOversamplingPeriodic2( i,InputIndex,InputMultiscaleIndex )
Fxx=InputMultiscaleIndex.Fxx;
Fyy=InputMultiscaleIndex.Fyy;
n1=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(1,1);
n2=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(2,1);
n3=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(3,1);
n4=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(4,1);
nkd=2*(n1+2)+2*(n4+2);
AppliedDisplacements=zeros(nkd,1);
if i==1 || i==2
   k=1;
elseif i==3 || i==4
   k=2;
elseif i==5 || i==6    
   k=3;   
elseif i==7 || i==8
   k=4;
end

if i==1 || i==3 || i==5 || i==7
    F(:,1)=Fxx(:,k);
elseif i==2 || i==4 || i==6 || i==8
    F(:,1)=Fyy(:,k);    
end

%Surfaces 1 and 3
for j=1:n1+2
   S1(j,1)=F(j,1);
   S3(j,1)=F(n1+n2+n3+5-j,1);
end
S(1:n1+2,1)=S1(:,1)-S3(:,1);

%Surfaces 2 and 4
if i==1 || i==2
    S4(1,1)=1;
    S2(1,1)=0;
elseif i==3 || i==4
    S4(1,1)=-1;
    S2(1,1)=0;    
elseif i==5 || i==6
    S4(1,1)=0;
    S2(1,1)=0; 
elseif i==7 || i==8
    S4(1,1)=0;
    S2(1,1)=0; 
end

for j=2:n4+2
   S4(j,1)=F(n1+n2+n3+n4+6-j,1); 
   S2(j,1)=F(n1+1+j,1);
end
S(n1+3:n1+n2+4,1)=S4(:,1)-S2(:,1);

if i==1 || i==3 || i==5 || i==7
h=1;
for j=1:2:nkd
    AppliedDisplacements(j,1)=S(h,1);
    h=h+1;
end
elseif i==2 || i==4 || i==6 || i==8
h=1;
for j=2:2:nkd
    AppliedDisplacements(j,1)=S(h,1);
    h=h+1;
end
end
end

