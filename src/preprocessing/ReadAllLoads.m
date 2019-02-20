function [ InputIndex ] = ReadAllLoads( text,InputIndex )

% Read Macro Nodal Loads---------------------------------------------------
[ InputIndex ] = ReadLoads( text,InputIndex );
%--------------------------------------------------------------------------

% Read Macro Traction Loads------------------------------------------------
[ InputIndex ] = ReadTraction( text,InputIndex );
%--------------------------------------------------------------------------
end 