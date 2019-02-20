function OutputCoarseFunction1( U,Coarse,InputIndex )
if InputIndex.OutputIndex.CoarsePropertiesIndex(1,1)==1 %case coarse properties
    %% Name of Coarse Property Output File
    [ Name ] = NameBoundaryConditions ( InputIndex ); %Name of Multiscale Boundary Conditions
    path=strcat(InputIndex.JobIndex,filesep,'Output',filesep,Name,filesep,'CoarseProperties',Name,'.out');
    %% Open Output file
    fidCoarseProperties  = fopen(path,'w');
    %% Write Number of Nodes, Degree of Freedom, Number of Elements
    fprintf(fidCoarseProperties,'%s','Coarse Elements Properties:');
    fprintf(fidCoarseProperties,'\n\n');
    fprintf(fidCoarseProperties,'%s %1.0f\n','Number of Nodes (Macro):',InputIndex.NumberOfNodes);
    fprintf(fidCoarseProperties,'%s %1.0f\n','Degree of Freedom (Macro):',InputIndex.DegreeOfFreedom);
    fprintf(fidCoarseProperties,'%s %1.0f\n','Number of Coarse Elements:',InputIndex.NumberOfElements);
    fprintf(fidCoarseProperties,'\n');
    %% Write coarse element connectivity
    fprintf(fidCoarseProperties,'%s\n','$ELEMENT_CONNECTIVITY');
    for i=1:InputIndex.NumberOfElements
        fprintf(fidCoarseProperties,'%1.0f\t %1.0f\t %1.0f\t %1.0f\t %1.0f\n',i,Coarse(i).NodeIndex(1,1),Coarse(i).NodeIndex(1,2),Coarse(i).NodeIndex(1,3),Coarse(i).NodeIndex(1,4));
    end
    %% Write coords of coarse element
    fprintf(fidCoarseProperties,'\n');
    fprintf(fidCoarseProperties,'%s\n','Macro Nodes (Undeformed):');
    fprintf(fidCoarseProperties,'%s\t %s\t\t %s\t\t','Node\Direction ','x','y');
    fprintf(fidCoarseProperties,'\n');
    for j=1:InputIndex.NumberOfNodes
        fprintf(fidCoarseProperties,'%1.0f %15.10f\t\t %15.10f\t\t',InputIndex.IndexXYNodes(j,:));
        fprintf(fidCoarseProperties,'\n');
    end
    fprintf(fidCoarseProperties,'\n');
    %% Write Prescribed Nodes
    fprintf(fidCoarseProperties,'%s\n','Prescribed Nodes:');
    for i=1:size(InputIndex.Constrains.IndividualDispConstIndex,1)  
        nodeIndexConstrain=InputIndex.Constrains.IndividualDispConstIndex(i,1);
        DirectionX=InputIndex.Constrains.IndividualDispConstIndex(i,2);
        DirectionY=InputIndex.Constrains.IndividualDispConstIndex(i,3);
        if DirectionX==0
            nDirectionX='x-Direction';
        else
            nDirectionX='';
        end
        if DirectionY==0
            nDirectionY='y-Direction';
        else
            nDirectionY='';
        end
        fprintf(fidCoarseProperties,'%1.0f\t %s\t %s\t\n',nodeIndexConstrain,nDirectionX,nDirectionY);
    end
    fprintf(fidCoarseProperties,'\n');
    %% Write Nodal Loads
    fprintf(fidCoarseProperties,'%s\n','Nodal Loads:');
    for i=1:size(InputIndex.Loads.IndividualLoadIndex,1)  
        nodeIndexConstrain=InputIndex.Loads.IndividualLoadIndex(i,1);
        DirectionX=InputIndex.Loads.IndividualLoadIndex(i,2);
        DirectionY=InputIndex.Loads.IndividualLoadIndex(i,3);
        if DirectionX~=0
            nDirectionX='x-Direction';
        else
            nDirectionX='';
        end
        if DirectionY~=0
            nDirectionY='y-Direction';
        else
            nDirectionY='';
        end
        fprintf(fidCoarseProperties,'%1.0f\t %s\t %s\t\n',nodeIndexConstrain,nDirectionX,nDirectionY);
    end
    fprintf(fidCoarseProperties,'\n');
    %% Write nodal displacements
    fprintf(fidCoarseProperties,'%s\n','Nodal Displacement:');
    fprintf(fidCoarseProperties,'%s\t %s\t\t %s\t\t','Node\Direction ','x','y');
    fprintf(fidCoarseProperties,'\n');
    for k=1:InputIndex.NumberOfNodes
        fprintf(fidCoarseProperties,'%1.0f %15.10f\t\t %15.10f\t\t',InputIndex.IndexXYNodes(k,1),U(2*k-1,1),U(2*k,1));
        fprintf(fidCoarseProperties,'\n');
    end
    %% Close Output file
    fidCoarseProperties  = fclose(fidCoarseProperties);  
end
end

