function OutputRVEFunction( RVE,InputMultiscaleIndex,InputIndex )
if InputIndex.OutputIndex.RVEPropertiesIndex==1 %case RVE Properties
    %% Name of RVE Property Output File
    iMicro=InputMultiscaleIndex.MicrostructureIndex;
    [ Name ] = NameBoundaryConditions ( InputIndex ); %Name of Multiscale Boundary Conditions
    path=strcat(InputIndex.JobIndex,filesep,'Output',filesep,Name,filesep,'Microstructure',num2str(iMicro));
    mkdir_if_not_exist(path); %Create subfolder of Microstructure
    path=strcat(path,filesep,'RVEProperties_Microstructure_',num2str(iMicro),'.out');
    fidRVEProperties  = fopen(path,'w');
    %% Write RVE Property Output File
    NamePro=char(strcat('Microstructure',{' '},num2str(iMicro),{' '},'RVE Element Properties:'));
    fprintf(fidRVEProperties,'%s',NamePro);
    fprintf(fidRVEProperties,'\n\n');
    fprintf(fidRVEProperties,'%s %1.0f\n','Number of Nodes (Micro) in RVE:',InputMultiscaleIndex.NumberofNodes);
    fprintf(fidRVEProperties,'%s %1.0f\n','Degree of Freedom (Micro) in RVE:',InputMultiscaleIndex.DegreeOfFreedomCoarseMicro);
    fprintf(fidRVEProperties,'%s %1.0f\n','Number of Nodes (Macro) in RVE:',InputMultiscaleIndex.NumberOfCoarseMacroNodes);
    fprintf(fidRVEProperties,'%s %1.0f\n','Degree of Freedom (Macro) in RVE:',InputMultiscaleIndex.DegreeOfFreedomCoarseMacro);
    fprintf(fidRVEProperties,'%s %1.0f\n','Number of Elements in RVE:',InputMultiscaleIndex.NumberOfElements);
    fprintf(fidRVEProperties,'\n');
    fprintf(fidRVEProperties,'%s\n','Macro Boundary Nodes:');
    fprintf(fidRVEProperties,'%s\t %s\t\t %s\t\t','Node\Direction ','x','y');
    fprintf(fidRVEProperties,'\n');    
    for j=1:InputMultiscaleIndex.NumberOfCoarseMacroNodes
        fprintf(fidRVEProperties,'%1.0f %15.10f\t\t %15.10f\t\t',InputMultiscaleIndex.IndexXYMacroBoundaryNodes(j,:));
        fprintf(fidRVEProperties,'\n');
    end
    fprintf(fidRVEProperties,'\n');
    fprintf(fidRVEProperties,'%s\n','Micro Nodes (Undeformed):');
    fprintf(fidRVEProperties,'%s\t %s\t\t %s\t\t','Node\Direction ','x','y');
    fprintf(fidRVEProperties,'\n');
    for j=1:InputMultiscaleIndex.NumberofNodes
        fprintf(fidRVEProperties,'%1.0f %15.10f\t\t %15.10f\t\t',InputMultiscaleIndex.IndexXYNodes(j,:));
        fprintf(fidRVEProperties,'\n');
    end
    fprintf(fidRVEProperties,'\n');
    fprintf(fidRVEProperties,'%s\n','Micro Boundary Nodes:');
    for j=1:InputMultiscaleIndex.NumberOfBoundedNodesRVE
        fprintf(fidRVEProperties,'%1.0f %15.10f\t\t %15.10f\t\t',InputMultiscaleIndex.IndexXYMicroBoundaryNodes(j,:));
        fprintf(fidRVEProperties,'\n');
    end
    fprintf(fidRVEProperties,'\n');
    fprintf(fidRVEProperties,'%s\n','Number of Micro Boundary Internal Nodes:');
    for j=1:4
        if j==1
            fprintf(fidRVEProperties,'%s %1.0f %s %1.0f %s %1.0f\n','Surface 1: Between Node ',InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1),' & Node ',InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1),': ',InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(1));
        elseif j==2
            fprintf(fidRVEProperties,'%s %1.0f %s %1.0f %s %1.0f\n','Surface 2: Between Node ',InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1),' & Node ',InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1),': ',InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(2));
        elseif j==3
            fprintf(fidRVEProperties,'%s %1.0f %s %1.0f %s %1.0f\n','Surface 3: Between Node ',InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1),' & Node ',InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1),': ',InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(3));
        elseif j==4
            fprintf(fidRVEProperties,'%s %1.0f %s %1.0f %s %1.0f\n','Surface 4: Between Node ',InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1),' & Node ',InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1),': ',InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(4));
        end
    end
    fprintf(fidRVEProperties,'\n');
    fprintf(fidRVEProperties,'%s\n','Basis Function:');
    for j=1:InputMultiscaleIndex.DegreeOfFreedomCoarseMicro
        fprintf(fidRVEProperties,'%15.10f\t\t',RVE{iMicro}.N(j,:));
        fprintf(fidRVEProperties,'\n');
    end
    fprintf(fidRVEProperties,'\n');
    fprintf(fidRVEProperties,'%s\n','R Matrices:');
    for j=1:InputMultiscaleIndex.NumberofNodes
        fprintf(fidRVEProperties,'%s %1.0f\n','R Matrix:',j);
        fprintf(fidRVEProperties,'%15.10f\t\t',RVE{iMicro}.R{j}(1,:));
        fprintf(fidRVEProperties,'\n');        
        fprintf(fidRVEProperties,'%15.10f\t\t',RVE{iMicro}.R{j}(2,:));
        fprintf(fidRVEProperties,'\n');
        fprintf(fidRVEProperties,'\n');
    end
    fprintf(fidRVEProperties,'\n');
    fprintf(fidRVEProperties,'%s\n','G Matrices:');
    for j=1:InputMultiscaleIndex.NumberOfElements
        fprintf(fidRVEProperties,'%s %1.0f\n','G Matrix:',j);
        for k=1:InputMultiscaleIndex.NumberOfCoarseMacroNodes
            fprintf(fidRVEProperties,'%15.10f\t\t',RVE{iMicro}.G{j}(k,:));
            fprintf(fidRVEProperties,'\n');        
        end
        fprintf(fidRVEProperties,'\n');
    end
    k=RVE{iMicro}.k;
    fprintf(fidRVEProperties,'\n');
    fprintf(fidRVEProperties,'%s\n','Stiffness Matrix :');
    for j=1:InputMultiscaleIndex.DegreeOfFreedomCoarseMacro
        fprintf(fidRVEProperties,'%15.10f\t\t',k(j,:));
        fprintf(fidRVEProperties,'\n');
    end
    fidRVEProperties  = fclose(fidRVEProperties);
end
end

