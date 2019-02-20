function [Jacob]=CalculateJacobian(XYZ,DerivativesOfShapeFunction)
%% Calculate the Jacobian
Jacob=DerivativesOfShapeFunction*XYZ';                   
end