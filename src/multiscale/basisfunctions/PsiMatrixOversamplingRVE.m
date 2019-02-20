function [ PsiXX,PsiYY,NPsiXX,NPsiYY ] = PsiMatrixOversamplingRVE( N,InputMultiscaleIndex )
%% Number of RVE Macro Nodes
nmn=InputMultiscaleIndex.NumberOfCoarseMacroNodes;
%% Number of RVE Boundary Nodes
nbn=InputMultiscaleIndex.NumberOfBoundedNodesRVE;
%% Number of RVE Boundary Global Nodes
nbnwo=size(InputMultiscaleIndex.BoundedNodesGlobalForOversampling,1);
%% Initialize matrices
PsiXX=zeros(nmn,nmn);
PsiYY=zeros(nmn,nmn);
NPsiXX1=zeros(nbnwo,8);
NPsiYY1=zeros(nbnwo,8);
NPsiXX=zeros(nbnwo,4);
NPsiYY=zeros(nbnwo,4);
%% Calculate the sub-basis function matrices NPsiXX, NPsiYY
for i=1:nbnwo
    nodeIndex=InputMultiscaleIndex.BoundedNodesGlobalForOversampling(i,1);
    NPsiXX1(i,:)=N(2*nodeIndex-1,:);
    NPsiYY1(i,:)=N(2*nodeIndex,:);
end
i=1;
for j=1:2:2*nmn
    NPsiXX(:,i)=NPsiXX1(:,j);
    i=i+1;
end
i=1;
for j=2:2:2*nmn
    NPsiYY(:,i)=NPsiYY1(:,j);
    i=i+1;
end
%% Calculate the sub-basis function matrices PsiXX, PsiYY 
j=1;
for i=1:nmn
    PsiXX(i,:)=NPsiXX(j,:);
    PsiYY(i,:)=NPsiYY(j,:);
    nbin=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodesForOversampling(i);
    j=j+nbin+1;
end
end

