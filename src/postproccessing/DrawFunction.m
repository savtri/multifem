function [ InputIndex ] = DrawFunction ( Coarse,InputIndex )
%% Draw Initial Structure of Coarse Elements
VisibleIndex=InputIndex.DrawIndex.DrawInitialStructureCoarseIndex(1,1);
SaveIndex=InputIndex.DrawIndex.DrawInitialStructureCoarseIndex(1,2);

nDim=InputIndex.nDim;

if VisibleIndex==1 || SaveIndex==1
    path=[InputIndex.JobIndex filesep 'Draw' filesep 'InitalStructureSections.png']; %Assign the Path
    fid=path;
    InputIndex.fID=InputIndex.fID+1; %Update Figure ID
    figureID=InputIndex.fID; %Assign Figure ID
    
    switch nDim
        case 2
            DrawInitialStructure2D( VisibleIndex,SaveIndex,Coarse,InputIndex,fid,figureID );
        case 3
            DrawInitialStructure3D( VisibleIndex,SaveIndex,Coarse,InputIndex,fid,figureID );
    end
end
%% Draw Different kind of Microstructures in Coarse Elements
VisibleIndex=InputIndex.DrawIndex.DrawInitialStructureCoarseIndex(1,3);
SaveIndex=InputIndex.DrawIndex.DrawInitialStructureCoarseIndex(1,4);
if VisibleIndex==1 || SaveIndex==1
    path=[InputIndex.JobIndex filesep 'Draw' filesep 'MicrostructuresCoarseElements.png']; %Assign the Path
    fid=path;
    InputIndex.fID=InputIndex.fID+1; %Update Figure ID
    figureID=InputIndex.fID; %Assign Figure ID
    switch nDim
    case 2
        DrawMicrostructures2D( VisibleIndex,SaveIndex,Coarse,InputIndex,fid,figureID );
    case 3
        DrawMicrostructures3D( VisibleIndex,SaveIndex,Coarse,InputIndex,fid,figureID );
    end
end
end

