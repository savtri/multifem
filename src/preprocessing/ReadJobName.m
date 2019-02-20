function [ InputIndex ] = ReadJobName( text,InputIndex )
%% Read the name of the job
idx = find(~cellfun('isempty',strfind(text,'$$JOBS'))) + 1;
LWm = cellfun(@(x) textscan(x,'%c'),text(idx),'un',0);
LWm = cell2mat([LWm{:}]).';
JobIndex(1,:)=LWm;
InputIndex.JobIndex=JobIndex;
mkdir_if_not_exist(InputIndex.JobIndex)
end

