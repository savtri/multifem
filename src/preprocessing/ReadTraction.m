function [ InputIndex ] = ReadTraction( text,InputIndex )
%%-------------------------------------------------------------------------
% This funct reads the tractions acting on each element / side 
%%-------------------------------------------------------------------------

%% Initialization 
 nside  = 0 ; aside = 0 ;
 px_unif= 0 ; py_unif=0 ; 
 nelem  = 0 ; aelem = 0 ; 
     

 %% Read on which Elements acting Tractions 
 idx = find(~cellfun('isempty',strfind(text,'$TRACTION'))) + 1;
if ~isempty(idx)
     InputIndex.Loads.iTraction=1;          
     LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
     LWm = cell2mat([LWm{:}]).';
     nelem = size(LWm,2);
     aelem = LWm;

    %% Read on which Sides acting Tractions 
     idx = find(~cellfun('isempty',strfind(text,'$TRACTION'))) + 2;
     LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
     LWm = cell2mat([LWm{:}]).';
     nside = size(LWm,2);
     aside = LWm;

     %% Read BC Tractions
     idx = find(~cellfun('isempty',strfind(text,'$TRACTION'))) + 3;
     %
     LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
     LWm = cell2mat([LWm{:}]).';
     px_unif = LWm(1,1); 
     py_unif = LWm(1,2); 

     if size(LWm,2)>2 
        pz_unif = LWm(1,3); 
     else
         pz_unif=0;
     end 
    %%
    InputIndex.Loads.Traction.el=aelem;
    InputIndex.Loads.Traction.aside=aside;
    InputIndex.Loads.Traction.val=[px_unif; py_unif;pz_unif];
 else
    InputIndex.Loads.iTraction=0;    
 end
%% 

% BCTract=zeros(InputIndex.NumberOfNodalLoadNodes,n);
% for i=1:InputIndex.NumberOfNodalLoadNodes
%     idx = find(~cellfun('isempty',strfind(text,'$$LOAD'))) + i + 1;
%     LWm = cellfun(@(x) textscan(x,'%f'),text(idx),'un',0);
%     LWm = cell2mat([LWm{:}]).';
%     NodalLoadIndex(i,:) = LWm;
% end
% 
% %%
% InputIndex.LoadTypeIndex.NodalLoadIndex=NodalLoadIndex;
end