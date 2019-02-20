function [ RVE,InputIndex ] = CreateRVEFunction(InputIndex, Coarse)

%% -- Initialization - Assign RVEs ---------------------------------------%
 RVE = cell(InputIndex.NumberOfMicrostructures,1) ;                       %
% --- End Assign RVEs ----------------------------------------------------%


%% -- Create All RVE for Different Microstructures  ---------------------------------------------------------------                                                                     
 for i=1:InputIndex.NumberOfMicrostructures                                % Loop Over All Microstructures                               
                                                                        
    % Read Input File                                                
    [ Fem,InputIndex,InputMultiscaleIndex ] = ReadInputRVE( i,Coarse, InputIndex );
                                                                       
    % Create RVE Properties                                          
    [ InputIndex,InputMultiscaleIndex ] = MakePropertiesRVE( InputIndex,InputMultiscaleIndex );   
    
    % Initialize Location for Integration Gauss Point 
    [ Fem, GP, InputIndex,InputMultiscaleIndex ] = InitializeFEMProps( Fem,InputIndex,InputMultiscaleIndex );
                                                                 
    % Create Solid/Porous/PhaseField Basis Function                                         
    [ N,  Fem,InputIndex,InputMultiscaleIndex ] = BasisFunctionRVE(Fem,InputIndex,InputMultiscaleIndex )   ;
        
    % Make R Matrices
    [ R ]  = DRIMatrixRVE( N, InputIndex, InputMultiscaleIndex )         ;    
    
    % Make G Matrices
    [ G ]  = GIMatrix( R, Fem, InputIndex,InputMultiscaleIndex );    
    
%% Allocate Final Matrices --------------------------------------------------------------------------                                
    [ k ] = KCoarseMatrix( Fem,G,InputMultiscaleIndex );               % Equivalent Stiffness Matrices                         
    iMicro= InputMultiscaleIndex.MicrostructureIndex;                  % Assign Microstructure  
    % This iMirco is the RVE Type. Different Coarse/MacroTypes 
    % Assign RVE Properties 
    RVE{iMicro,1}.R=R;                                                 % Genaralized Basis  function
    RVE{iMicro,1}.G=G;                                                 % Genaralized Basis  function
    RVE{iMicro,1}.N=N;                                                 % Genaralized Basis  function
    RVE{iMicro,1}.k=k;                                                 % Equivalent Stiffness Matrix
    RVE{iMicro,1}.Fem  = Fem;                                          % Finite Elements of RVE
    RVE{iMicro,1}.XYZ  = InputMultiscaleIndex.IndexXYNodes;         % FE Coords  
    RVE{iMicro,1}.XYZMicroBoundaryNodes =InputMultiscaleIndex.IndexXYMicroBoundaryNodes;
    RVE{iMicro,1}.NoMicroElem=InputMultiscaleIndex.NumberOfElements;% Number of MicroFE in this Coarse 
    OutputRVEFunction( RVE,InputMultiscaleIndex,InputIndex );          % Output RVE Props                               
    % Allocate Gauss Point Matrices --------------------------------------------------------------------------
    iMicro            = InputMultiscaleIndex.MicrostructureIndex;          % Assign Microstructure
    RVE{iMicro,1}.GPs = GP;                                                % Gauss Points
   % ---------------------------------------------------------------------------------------------------     
 
 end % Loop Over All Microstructures 

   
end % function


