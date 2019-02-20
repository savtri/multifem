function [ Fem ] = CreateRVEFiniteElements( InputMultiscaleIndex )
for n=1:InputMultiscaleIndex.NumberOfElements
    [ Femt ] = RVEFiniteElementFunction( n,InputMultiscaleIndex );
    Fem(n)=Femt;
end
end

