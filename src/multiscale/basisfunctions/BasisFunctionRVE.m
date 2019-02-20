function [ Ngen,Fem,InputIndex,InputMultiscaleIndex ] = BasisFunctionRVE( Fem,InputIndex,InputMultiscaleIndex )

%% -------------------------------------------------------------------------------------------------------------------------------------    
% Initialize
%--------------------------------------------------------------------------------------------------------------------------------------
ibc_type    = InputMultiscaleIndex.MultiscaleBoundaryConditionsIndex ;
%% -------------------------------------------------------------------------------------------------------------------------------------    
%--------------------------------------------------------------------------------------------------------------------------------------
if ibc_type ==3 || ibc_type==4       % Case OVERSAMPLING BC

    % Redefinition due to Oversampling
    [ InputIndex,InputMultiscaleIndex ] = RedefinitionDueToOversamplingRVE( InputIndex,InputMultiscaleIndex );
    % Assign the basis function Matrix
    N=zeros(InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,InputMultiscaleIndex.DegreeOfFreedomCoarseMacro);
    % RVE stiffness matrix
    [ K ] = StiffnessMatrixRVE( Fem,InputIndex,InputMultiscaleIndex );
    % Calculate the basis function for each macro degree of freedom

    for iMnod=1:InputMultiscaleIndex.NumberOfCoarseMacroNodes
        %Define Number of Kinematic Discriptions                                            
        [ NumberOfKinematicDescriptions ] = NumberOfKinematicDescriptionsRVE( iMnod, InputIndex,InputMultiscaleIndex );    

        for iMdof=1:InputMultiscaleIndex.nDofsPerMacroNode;                                    
            adof=InputMultiscaleIndex.nDofsPerMacroNode*(iMnod-1)+iMdof;        
            %
            [ N, u, InputIndex,InputMultiscaleIndex ]=Get_Multi_Shape_Function(adof,iMdof,iMnod,K,N,NumberOfKinematicDescriptions,InputIndex,InputMultiscaleIndex);
            %
            VisibleIndex=InputIndex.DrawIndex.DrawBasisFunctionStructureRVEIndex(1,1);
            SaveIndex=InputIndex.DrawIndex.DrawBasisFunctionStructureRVEIndex(1,1);
            if VisibleIndex==1 || SaveIndex==1
                %Define the name of Figure
                [ fid ] = BasisFunctionName( adof,InputIndex,InputMultiscaleIndex );
                %Draw Deformed Shape From Basis Function
                InputIndex.fID=InputIndex.fID+1; %Update Figure ID
                figureID=InputIndex.fID; %Assign Figure ID
                DrawBasisFunctionsRVE( adof,Fem,u,InputIndex,InputMultiscaleIndex,fid,figureID ); 
            end
        end 
    end

    % Delete Nxy, Nyx
    [ N ] = DeleteNxyNyxRVE( N,InputMultiscaleIndex );
    % Check Basis Functions
    BasisFunctionCheck( N,InputMultiscaleIndex.NumberOfCoarseMacroNodes,InputMultiscaleIndex.NumberofNodes );
    % Find the Psi Matrix
    [ PsiXX,PsiYY,NPsiXX,NPsiYY ] = PsiMatrixOversamplingRVE( N,InputMultiscaleIndex );
    % Find the Fxx,Fyy Matrix
    [ InputMultiscaleIndex ] = FxxFyyMatrixOversamplingRVE( PsiXX,PsiYY,NPsiXX,NPsiYY,InputMultiscaleIndex );
    % Redefinition again without Oversampling
    [ Fem,InputIndex,InputMultiscaleIndex ] = RedefinitionDueToOversamplingRVE2( InputIndex,InputMultiscaleIndex );
    %Reallocate N to Nall which is the output of this function 
    Ngen  =  N ;

end  % End Case OVERSAMPLING BC

% START AGAIN WITHOUT OVERSAMPLING REGION ---------------------------------------------------------------------------------------------

% Basis function Matrix
N=zeros(InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,InputMultiscaleIndex.DegreeOfFreedomCoarseMacro);
% RVE stiffness matrix
[ K ] = StiffnessMatrixRVE( Fem,InputIndex,InputMultiscaleIndex );
% Calculate the basis function for each macro degree of freedom
for iMnod=1:InputMultiscaleIndex.NumberOfCoarseMacroNodes
    %Define Number of Kinematic Discriptions
    [ NumberOfKinematicDescriptions ] = NumberOfKinematicDescriptionsRVE( iMnod,InputIndex,InputMultiscaleIndex );
    for iMdof=1:InputMultiscaleIndex.nDofsPerMacroNode;    
        adof=InputMultiscaleIndex.nDofsPerMacroNode*(iMnod-1)+iMdof;
        %
        [ N,u,InputIndex,InputMultiscaleIndex ]=Get_Multi_Shape_Function(adof,iMdof, iMnod,K,N,NumberOfKinematicDescriptions,InputIndex,InputMultiscaleIndex);        
        %
        VisibleIndex=InputIndex.DrawIndex.DrawBasisFunctionStructureRVEIndex(1,1);
        SaveIndex=InputIndex.DrawIndex.DrawBasisFunctionStructureRVEIndex(1,1);
        if VisibleIndex==1 || SaveIndex==1
            %Define the name of Figure
            [ fid ] = BasisFunctionName( adof,InputIndex,InputMultiscaleIndex );
            %Draw Deformed Shape From Basis Function
            InputIndex.fID=InputIndex.fID+1; %Update Figure ID
            figureID=InputIndex.fID; %Assign Figure ID
            DrawBasisFunctionsRVE( adof,Fem,u,InputIndex,InputMultiscaleIndex,fid,figureID ); 
        end
    end
end
%Reallocate N to Nall which is the output of this function 
Ngen  =  N ;
       
%% -------------------------------------------------------------------------------------------------------------------------------------    
% Check Basis Functions
%---------------------------------------------------------------------------------------------------------------------------------------
BasisFunctionCheck( N, InputMultiscaleIndex,1);
%% -------------------------------------------------------------------------------------------------------------------------------------    
% Print Shape Functions
%---------------------------------------------------------------------------------------------------------------------------------------
switch ibc_type
case 3  %Linear         
    InputIndex.AnalIndex.MultiscaleIndex(1,2)=3;
case 4  %Periodic
    InputIndex.AnalIndex.MultiscaleIndex(1,2)=4;
    
end
