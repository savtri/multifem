function v=main()
%     Enhanced Multiscale Finite Element Method Using Matlab, Version 1.1.0, 2016
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     A copy of the GNU General Public License is found in the file
%     <license.txt> following this collection of matlab files.
%     This license can be also found at: <http://www.gnu.org/licenses/>.    
%
%     For more information on the software, please visit: <http://www.nottingham.ac.uk/~ezzst1/>

clc;
clearvars;  close all;  
add2Path;

% This source code implemented the enhanced multiscale finite element
% method for the case of plane stress problems. It utilizes full
% integration quadilateral plane stress element at the micro scale. 
%
%The following coarse element boundary conditions are considered
%
%1. Linear boundary conditions
%2. Periodic boundary conditions
%3. Linear boundary conditions with oversampling   (Currently only for 2D
%                                                   analysis)
%4. Periodic boundary conditions with oversampling (Currently only for 2D
%                                                   analysis)

% Release note - Updates from 1.0.1
% Major source code updates in Macro boundary condition defintions
% Hex - Solid element available for 3D analysis

%Refer to the file Readme.txt for details on input file syntax

%Further information on the method, as well as its implementation for the
%case of nonlinear dynamics problems can be found in


%TRIANTAFYLLOU, S. P. and CHATZI, E. N., 2014. A hysteretic multiscale formulation 
%for nonlinear dynamic analysis of composite materials: Computational Mechanics.

%This source code is meant for academic and educational purposes. For a
%fully optimized implementation please contact
%savvas.triantafyllou@nottingham.ac.uk

%% Read Input Address File
[ fid,textAddress ] = ReadInputAddressFile( );
%% Read Input Data File
[ Coarse,InputIndex ] = ReadInputData( fid,textAddress );
%% Enhanced Multiscale Finite Element Method
[ Coarse,InputIndex,U]=EMsFEM(InputIndex,Coarse );
% MsFEM Solution for Static/Dynamic Solid/Porous --------------------------
v=1;
end