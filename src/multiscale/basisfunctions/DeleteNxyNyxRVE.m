function [ N ] = DeleteNxyNyxRVE( N,InputMultiscaleIndex )
% Delete Nxy, Nyx

for i=1:2:2*InputMultiscaleIndex.NumberOfCoarseMacroNodes
    for j=2:2:InputMultiscaleIndex.DegreeOfFreedomCoarseMicro
        N(j,i)=0;
    end
end

for i=2:2:2*InputMultiscaleIndex.NumberOfCoarseMacroNodes
    for j=1:2:InputMultiscaleIndex.DegreeOfFreedomCoarseMicro
        N(j,i)=0;
    end
end

end

