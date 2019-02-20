function [ Coarse ] = CreateCoarseElements( InputIndex )
%% Create Coarse Elements
for n=1:InputIndex.NumberOfElements
    [ Coarset ] = CoarseElementFunction( n,InputIndex );
    Coarse(n)=Coarset;
end
end

