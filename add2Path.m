dir{1}=[pwd '/src/preprocessing'];
dir{2}=[pwd '/src/postproccessing'];
dir{3}=[pwd '/src/femfiles'];
dir{4}=[pwd '/src/multiscale'];
dir{5}=[pwd '/src/multiscale/basisfunctions'];

numPaths=length(dir);

for ipath=1:numPaths
    addpath(dir{ipath})
end