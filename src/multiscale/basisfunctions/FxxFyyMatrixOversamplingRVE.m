function [ InputMultiscaleIndex ] = FxxFyyMatrixOversamplingRVE( PsiXX,PsiYY,NPsiXX,NPsiYY,InputMultiscaleIndex )
%% Number of RVE Macro Nodes
nmn=InputMultiscaleIndex.NumberOfCoarseMacroNodes;
%% Number of RVE Boundary Nodes
nbn=size(InputMultiscaleIndex.BoundedNodesGlobalForOversampling,1);
NPsiXX(nbn+1,:)=NPsiXX(1,:);
NPsiYY(nbn+1,:)=NPsiYY(1,:);
%% Solve 4X4 system to calculate cijxx coefficients
cijxx=zeros(nmn,nmn);
Fxx=zeros(nbn,nmn);
FxxTemporary=eye(nmn);
for i=1:nmn
    cijxx(:,i)=PsiXX\FxxTemporary(:,i);
end
%% Calculate Fxx
for i=1:nmn
    for j=1:nbn
        Fxx(j,i)=NPsiXX(j,:)*cijxx(:,i);
    end
end
%% Check Fxx equal to unity
sx=zeros(nbn,1);
for i=1:nbn
    sx(i)=sum(Fxx(i,:));
    if abs(sx(i)-1)>=0.00001
        disp('Error in temporary basis function Fxx in boundary node:');
        disp(i);
        stop
    end
end
%% Solve 4X4 system to calculate cijyy coefficients
cijyy=zeros(nmn,nmn);
Fyy=zeros(nbn,nmn);
FyyTemporary=eye(nmn);
for i=1:nmn
    cijyy(:,i)=PsiYY\FyyTemporary(:,i);
end
%% Calculate Fyy
for i=1:nmn
    for j=1:nbn
        Fyy(j,i)=NPsiYY(j,:)*cijyy(:,i);
    end
end
%% Check Fyy equal to unity
sy=zeros(nbn,1);
for i=1:nbn
    sy(i)=sum(Fyy(i,:));
    if abs(sy(i)-1)>=0.00001
        disp('Error in temporary basis function Fyy in boundary node:');
        disp(i);
        stop
    end    
end
%% Delete very small values of Fxx and Fyy for round-off errors
for i=1:nmn
    for j=1:nbn
        if abs(Fxx(j,i))<=0.00000001
            Fxx(j,i)=0;
        end
        if abs(Fyy(j,i))<=0.00000001
            Fyy(j,i)=0;
        end
    end
end
%% Assign Fxx, Fyy
InputMultiscaleIndex.Fxx=Fxx;
InputMultiscaleIndex.Fyy=Fyy;
end

