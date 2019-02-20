function [ InputIndex,InputMultiscaleIndex ] = ReadDiffKindSectionAndMaterialRVE( textCoarse,InputIndex,InputMultiscaleIndex )
% Read the different kind of sections and material of RVE elements
thickness=zeros(InputMultiscaleIndex.NumberOfDifferentSections,1); %Define Thickness Modulus Vector
E        =zeros(InputMultiscaleIndex.NumberOfDifferentSections,1); %Define Young's   Modulus Vector
v        =zeros(InputMultiscaleIndex.NumberOfDifferentSections,1); %Define Poisson   Modulus Vector

for i=1:InputMultiscaleIndex.NumberOfDifferentSections     %Loop for all different sections of RVE
    %Read the different kind of sections
    idx = find(~cellfun('isempty',strfind(textCoarse,'$$SECTION'))) + i;
    LWm = cellfun(@(x) textscan(x,'%f'),textCoarse(idx),'un',0);
    LWm = cell2mat([LWm{:}]).';
    thickness(i,1) = LWm(:,2);    
    %Read Material of Elements
    idx = find(~cellfun('isempty',strfind(textCoarse,'$ELASTIC'))) + i;
    LWm = cellfun(@(x) textscan(x,'%f'),textCoarse(idx),'un',0);
    LWm = cell2mat([LWm{:}]).';
    MaterialProperties = LWm;
    E(i,1)=MaterialProperties(:,2);
    v(i,1)=MaterialProperties(:,3);
    %Convert E,v to Lame Constants 
    [ Lambda(i,1),mu(i,1) ]=ConvertFromEandVToLameConstants( E(i,1),v(i,1) );
end
InputMultiscaleIndex.thickness= thickness; %Assign thickness
InputMultiscaleIndex.E        = E;         %Assign Young's modulus
InputMultiscaleIndex.v        = v;         %Assign Poisson ratio
InputMultiscaleIndex.Lambda   = Lambda;    %Assign the Lambda (Lame Constant)
InputMultiscaleIndex.mu       = mu;        %Assign the mu     (Lame Constant)

InputIndex.thickness          = thickness;
InputIndex.E                  = E;
InputIndex.v                  = v;
InputIndex.Lambda             = Lambda;   
InputIndex.mu                 = mu;       

%% (only for Oversampling Linear and Periodic)
if InputIndex.AnalIndex.MultiscaleIndex(1,2)==3 || InputIndex.AnalIndex.MultiscaleIndex(1,2)==4
    thicknessForOversampling=zeros(InputMultiscaleIndex.NumberOfDifferentSectionsForOversampling,1); %Define Thickness Modulus Vector
    EForOversampling        =zeros(InputMultiscaleIndex.NumberOfDifferentSectionsForOversampling,1); %Define Young's Modulus Vector
    vForOversampling        =zeros(InputMultiscaleIndex.NumberOfDifferentSectionsForOversampling,1); %Define Poisson Modulus Vector    
    
    for i=1:InputMultiscaleIndex.NumberOfDifferentSectionsForOversampling
        %Read the different kind of sections
        idx = find(~cellfun('isempty',strfind(textCoarse,'$$SECTION')))+ i;
        LWm = cellfun(@(x) textscan(x,'%f'),textCoarse(idx),'un',0);
        LWm = cell2mat([LWm{:}]).';
        thicknessForOversampling(i,1) = LWm(:,2);

        %Read the material of elements
        idx = find(~cellfun('isempty',strfind(textCoarse,'$ELASTIC'))) + i;
        LWm = cellfun(@(x) textscan(x,'%f'),textCoarse(idx),'un',0);
        LWm = cell2mat([LWm{:}]).';
        MaterialProperties = LWm;
        EForOversampling(i,1)=MaterialProperties(:,2);
        vForOversampling(i,1)=MaterialProperties(:,3);
    end
    InputMultiscaleIndex.thicknessForOversampling=thicknessForOversampling; %Assign thickness
    InputMultiscaleIndex.EForOversampling        =EForOversampling; %Assign Young's modulus
    InputMultiscaleIndex.vForOversampling        =vForOversampling; %Assign Poisson ratio
end


end

