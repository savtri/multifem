function [ Coarse, RVE, InputIndex,U] = MsFEM_StaticProcedure( Coarse, RVE, InputIndex ) 

    % Impose Kinematic Boundary Condtions at Macro Scale                  %
    [ Constrains] = ConstrainsMatrix( InputIndex );               %   %SOS-This func is dof Depended (2per node) 
                                                                          %
    % Known/ Unknown Displacements at the Macro scale                     %
    dof = InputIndex.DegreeOfFreedom;                                     %
    [ KnownDis,UnKnownDis] = NumberOfKnownDisplacements(Constrains,dof);  %
                                                                          %
    % Rearrange Matrix (Macro)                                            %
    [ V ] = VRearrangeFunction( Constrains,dof,KnownDis );                %
                                                                          %
    % External Forces (Macro)                                             %
    [ P ] = ExternalForceMatrix( InputIndex );                            %  %SOS-This func is dof Depended (2per node) 
                                                                          %
    % Total Displacement Matrix (Macro)                                   %
      U = zeros(dof,1); Pw =[]   ;                                        %
                                                                          %
    % Build Coarse Scale Stiffness Matrix                                 %                           
    disp('Evaluating Macro Stiffness Matrix')    ; tic;                   %
    [ K ] = BuildCoarseStiff( Coarse,RVE,InputIndex )    ;                %
    Strng= ['Done - Time Elapsed: ',num2str(toc),' sec'];                 %
    disp(Strng);                                                          %
                                                                          %
    % Solve Macro Unknown Disp                                            %
    % ReArrange Free Part Stiffness and External Load Matrices            %
    [Kff,Pf] = GetFreeMats(V,K,P,UnKnownDis);                             %
                                                                          %
    %Displacement Matrix of Unknown Displacements                         %
    Uf = zeros(UnKnownDis,1);                                             %
                                                                          %
    %Solve Kff*Uf=Pf                                                      %
    disp('Solving at the macro scale');   tic;                            %
    Uf  =  Kff\Pf;                                                        %
    Strng =  ['Done - Time Elapsed: ',num2str(toc),' sec'];               %
    disp(Strng);                                                          %
                                                                          %
    % Known Displacement Vector and  Global Displacement (Macro) Matrix   %
    Us = zeros(KnownDis,1);          U  = transpose(V)\[Uf;Us];           %                                           
                                                                          %
    % Output Macro Scale Data                                             %
    OutputCoarseFunction1( U,Coarse,InputIndex );                         %
                                                                          %
    % Downscale Computations (Micro Strain/Stress Fields)                 %
    disp('Downscale computations');    tic;                               %
    [ Coarse ] = DownScale( U,RVE,Coarse,InputIndex );                    %
    Strng    = ['Done - Time Elapsed: ',num2str(toc),' sec'];             %
    disp(Strng);                                                          %
                                                                          %                                                                          
    % Output Micro FEM Data                                               %
    disp('Writting Output');  tic;                                        %   
    for i=1:InputIndex.NumberOfElements      % Loop over Coarse Elements  %
        iMicro=Coarse(i).MicrostructureType; % Microstructure Type        %
        nElRVE=size(RVE{iMicro,1}.Fem,2);                                 %
        for g=1:nElRVE                       % Loop over FE in RVE        %
            OutputMicroData( i,g,Coarse,iMicro,RVE,InputIndex );          %
        end                                                               %
    end                                                                   %
    Strng=['Done - Time Elapsed: ',num2str(toc),' sec'];                  %
                                                                          % 
end % END CASE MsFEM STATIC SOLID  -------------------------------------------%    
    