function [ InputIndex ] = DrawRVEFunction( Fem,InputIndex,InputMultiscaleIndex )
%% Draw Initial Structure of RVE
VisibleIndex=InputIndex.DrawIndex.DrawInitialStructureRVEIndex(1,1); %case Visible
SaveIndex=InputIndex.DrawIndex.DrawInitialStructureRVEIndex(1,2); %case Save
%
nDim=InputIndex.nDim;
%
if VisibleIndex(1,1)==1 || SaveIndex==1 || InputIndex.DrawIndex.DrawInitialStructureRVEIndex(1,3)==1 || InputIndex.DrawIndex.DrawInitialStructureRVEIndex(1,4)==1 
    NameFile=strcat('Initial_RVE_Microstructure_',num2str(InputMultiscaleIndex.MicrostructureIndex),'.png');
    path=[InputIndex.JobIndex filesep 'Draw' filesep NameFile]; %Assign the Path
    fid=path; 
    InputIndex.fID=InputIndex.fID+1; %Update Figure ID
    figureID=InputIndex.fID; %Assign Figure ID
    %
    switch nDim
        case 2
            DrawInitialRVEStructure2D( VisibleIndex,SaveIndex,Fem,InputMultiscaleIndex,fid,figureID );
        case 3
            DrawInitialRVEStructure3D( VisibleIndex,SaveIndex,Fem,InputMultiscaleIndex,fid,figureID );           
    end
end

%% Draw Initial Structure Sections of RVE
VisibleIndex=InputIndex.DrawIndex.DrawInitialStructureRVEIndex(1,3); %case Visible
SaveIndex=InputIndex.DrawIndex.DrawInitialStructureRVEIndex(1,4); %case Save 
if VisibleIndex==1 || SaveIndex==1
    NameFile=strcat('RVE_Sections_Microstructure_',num2str(InputMultiscaleIndex.MicrostructureIndex),'.png',num2str(i),'.png');
    path=[InputIndex.JobIndex filesep 'Draw' filesep NameFile]; %Assign the Path
    fid=path;
    InputIndex.fID=InputIndex.fID+1; %Update Figure ID
    figureID=InputIndex.fID; %Assign Figure ID
    %
    switch nDim
        case 2
            DrawInitialRVEStructureSections2D( VisibleIndex,SaveIndex,Fem,InputIndex,InputMultiscaleIndex,fid,figureID );
        case 3
            DrawInitialRVEStructureSections3D( VisibleIndex,SaveIndex,Fem,InputIndex,InputMultiscaleIndex,fid,figureID );
    end
end
end

