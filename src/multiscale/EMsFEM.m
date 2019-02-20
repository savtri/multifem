function [ Coarse,InputIndex, U]=EMsFEM(InputIndex, Coarse )

%% Init
U=[];
     
%-----------------------------------------------------------------------------------------------------------
% STEP 1. Evaluate Micro to Macro Shape Functions 
%-----------------------------------------------------------------------------------------------------------
disp('Evaluating Micro to Macro Shape Functions') ; tic     ;          
[ RVE, InputIndex ] = CreateRVEFunction(InputIndex, Coarse) ;          
Strng = ['All RVE Done - Time Elapsed: ',num2str(toc),'sec'];          
disp(Strng)                                                 ;                                                                           

[ Coarse, RVE, InputIndex,U ] = MsFEM_StaticProcedure(Coarse,RVE,InputIndex); 

end  % End Fuction

