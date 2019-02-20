# Multiscale Finite Element methods for linear elasticity

This repository contains matlab source code to perform linear elastic analysis of continuum media using the multiscale finite element method.

If you find MultiFEM helpful for your research, we kindly ask that you consider citing the paper:

Triantafyllou, S.P. and Chatzi, E.N., 2014. A hysteretic multiscale formulation for nonlinear dynamic analysis of composite materials. Computational Mechanics, 54(3), pp.763-787.

## Authors

Emmanouil K. Kakouris and Savvas P. Triantafyllou (The University of Nottingham)

## Instructions

Two example inputs are provided in the files

1) InputMultiscaleExample.inp for the case of 2D domains with quadrilateral elements and
2) InputsimpleExample3D.inp for the case of 3D domains with hex elements

The path to the input file name to be run should be provided in the file InputAddressFile.inp. 
The input file syntax is described in the following files

Readme_InputAddressFile
Readme_InputMultiscaleExample
Readme_MicroLinear_Or_Periodic for linear or periodic boundary conditions
Readme_MicroOversamplingLinear_Or_OversamplingPeriodic for Oversampling


## License

MultiFEM is a free software: you can redistribute it and/or modify it under the
terms of the GNU Lesser General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

MultiFEM is distributed freely but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with MaPoMe. If not, see <http://www.gnu.org/licenses/>.