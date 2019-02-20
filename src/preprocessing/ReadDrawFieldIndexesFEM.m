function [ InputIndex ] = ReadDrawFieldIndexesFEM( text,InputIndex )
%% Find the total number of Field
%Find the start index
startIdx = find(~cellfun('isempty',strfind(text,'$DRAW_FIELD')))+1;
if ~isempty(startIdx)
    InputIndex.DrawIndex.iDraw=1;
    %Find the end index
    endIdx=InputIndex.Dollar(find(InputIndex.Dollar==startIdx)+1,1);
    %Re-Assign start/end index 
    startIdx=startIdx+1;
    endIdx=endIdx-1;
    %Find the total number of Graphs
    InputIndex.NumberOfDrawField=endIdx-startIdx+1;

    %% Read the fields paramters
    for i=1:InputIndex.NumberOfDrawField
        idx = find(~cellfun('isempty',strfind(text,'$DRAW_FIELD'))) + i+1; %Find the Line of Keyword
        LWm = cellfun(@(x) textscan(x,'%c'),text(idx),'un',0); %Read the line
        LWm = cell2mat([LWm{:}]).'; %Assign the text of this line
        FindSlash=find(LWm=='/'); %Find / in text
        FindLine=find(LWm=='-'); %Find - in text
        nText=size(LWm,2); %Find the size of text
        AnimationIndex=str2double(LWm(1:FindSlash(1,1)-3)); %Animation Index
        VisibleIndex=str2double(LWm(FindSlash(1,1)-2)); %Visible Index
        SaveIndex=str2double(LWm(FindSlash(1,1)-1)); %Save Index
        Dir=str2double(LWm(FindSlash(1,1)+1:FindSlash(1,2)-1)); %Direction Index 
        StepFrame=str2double(LWm(FindSlash(1,2)+1:FindSlash(1,3)-1)); %Step of Frame Index
        FinalFrame=str2double(LWm(FindSlash(1,3)+1:FindSlash(1,4)-1)); %Final Frame Index
        Factor=str2double(LWm(FindSlash(1,4)+1:FindSlash(1,5)-1)); %Factor Index
        ParticleIndex=str2double(LWm(FindSlash(1,5)+1:FindSlash(1,6)-1)); %Particle Index (case 0 no Particles, case 1 Paticles) 
        Form=(LWm(FindSlash(1,6)+1:FindSlash(1,7)-1)); %Format Index
        FileName=(LWm(FindSlash(1,7)+1:FindSlash(1,8)-1)); %File Name
        ColorBarName=(LWm(FindSlash(1,8)+1:FindSlash(1,9)-1)); %Colorbar name
        var=LWm(FindLine(1,1)+1:nText); %x Direction variable
        %Assign Graphs Parameters
        InputIndex.DrawIndex.DrawFields{i,:}={AnimationIndex,VisibleIndex,SaveIndex,Dir,StepFrame,FinalFrame,Factor,ParticleIndex,Form,FileName,ColorBarName,var};
    end
else
    InputIndex.DrawIndex.iDraw=0;
end
end

