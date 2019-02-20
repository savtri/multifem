function [Kff,Pf]=GetFreeMats(V,K,P,UnKnownDis)
% Rearrange the stiffnes matrix
KV=transpose(V)*K*V;
% Rearrange the force matrix
PV=transpose(V)*P;
% Stiffness matrix of unknown displacements 
Kff=KV(1:UnKnownDis,1:UnKnownDis);
% External force matrix of unknown displacements
Pf=PV(1:UnKnownDis,:);
end