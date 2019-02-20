function [ Nokn, NoUnKn ] = NumberOfKnownDisplacements( ConstVector, NoTotalValues )

% NoKn   -> Number of Known   Values 
% NoUnKN -> Number of UnKnown Values 

%--------------------------------------------------------------------------
% Known Displacements
Nokn = 0;
for i=1:NoTotalValues
    if (ConstVector(i)==0)
        Nokn=Nokn+1;
    end
end
%--------------------------------------------------------------------------
% Unknown Displacements (Macro)
 NoUnKn = NoTotalValues-Nokn;
%--------------------------------------------------------------------------
end

