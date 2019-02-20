function OutputMicroData( i,g,Coarse,iMicro,RVE,InputIndex )
%% Assignments
umf=Coarse(i).Micro(g).umf;
egp(:,:)=Coarse(i).Micro(g).egp(:,:);
sgp(:,:)=Coarse(i).Micro(g).sgp(:,:);
%% Output File
if InputIndex.OutputIndex.CoarsePropertiesIndex(1,1)==1 %case coarse properties
    [ Name ] = NameBoundaryConditions ( InputIndex ); %Name of Multiscale Boundary Conditions
    path=strcat(InputIndex.JobIndex,filesep,'Output',filesep,Name,filesep,'CoarseProperties',Name,'.out');
    %% Open Output file
    fidCoarseProperties  = fopen(path,'a+');
    fprintf(fidCoarseProperties,'\n\n');
    %% Finite element Index
    femIndex=char(strcat('**********Properties of Finite Element',{' '},num2str(g),{' '},'in Coarse Element',{' '},num2str(i),'**********'));
    fprintf(fidCoarseProperties,'%s',femIndex);
    fprintf(fidCoarseProperties,'\n\n');
    %% Write nodal displacements of Finite element g in Coarse i
    fprintf(fidCoarseProperties,'%s\n','Nodal Displacement:');
    fprintf(fidCoarseProperties,'%s\t %s\t\t %s\t\t','Node\Direction ','x','y');
    fprintf(fidCoarseProperties,'\n');
    for k=1:RVE{iMicro}.Fem(g).nNodes %Loop for each node of finite element
        fprintf(fidCoarseProperties,'%1.0f %15.10f\t\t %15.10f\t\t',RVE{iMicro}.Fem(g).NodeIndex(1,k),umf(2*k-1,1),umf(2*k,1));
        fprintf(fidCoarseProperties,'\n');
    end 
    fprintf(fidCoarseProperties,'\n');
    %% Write strains in gauss points of Finite element g in Coarse i
    fprintf(fidCoarseProperties,'%s\n','Strains:');
    fprintf(fidCoarseProperties,'%s\t %s\t\t %s\t\t','Gauss Point\exx - eyy - exy ');
    fprintf(fidCoarseProperties,'\n');
    for k=1:RVE{iMicro}.Fem(g).nNodes %Loop for each node of finite element
        gpn=char(strcat('Gauss Point',{' '},num2str(k),{' '},':'));
        fprintf(fidCoarseProperties,'%s %15.10f\t\t %15.10f\t\t %15.10f\t\t',gpn,egp(1,k),egp(2,k),egp(3,k));
        fprintf(fidCoarseProperties,'\n');
    end
    fprintf(fidCoarseProperties,'\n');
    %% Write gauss points stresses of Finite element g in Coarse i
    fprintf(fidCoarseProperties,'%s\n','Stresses:');
    fprintf(fidCoarseProperties,'%s\t %s\t\t %s\t\t','Gauss Point\sxx - syy - sxy ');
    fprintf(fidCoarseProperties,'\n');
    for k=1:RVE{iMicro}.Fem(g).nNodes %Loop for each node of finite element
        gpn=char(strcat('Gauss Point',{' '},num2str(k),{' '},':'));
        fprintf(fidCoarseProperties,'%s %15.10f\t\t %15.10f\t\t %15.10f\t\t',gpn,sgp(1,k),sgp(2,k),egp(3,k));
        fprintf(fidCoarseProperties,'\n');
    end
    %% Close Output file
    fidCoarseProperties  = fclose(fidCoarseProperties);
end
end