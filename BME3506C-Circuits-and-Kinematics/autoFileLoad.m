% This file is designed to open .m files from QTM in the current directory and
% change the structure of the data to a more manageable format.
% (c) 2016 Derek J Lura, Bioengineering, Florida Gulf Coast University.

% Notes:
%   - File names must not be changed after exporting .m files
%   - All files must have legal variable names
%   - Most opperations can be performed inside the file loop if you want
%   them to apply to all files being processed.

clear all
close all

% Testing Script
cDir = dir('*.mat');
filenames = {cDir.name};

% For all .mat files in dir
for j = 1:size(filenames,2) % Start [FileLoop] 
    
    % Get current file name
    filename = char(filenames(j));
    
    % Load file
    temp = load(filename);
    
    % Remore .mat from file name to use as field
    filename = filename(1:(end-4));
    
    % Get Marker Names
    Labels = temp.(filename).Trajectories.Labeled.Labels;
    DataArray = temp.(filename).Trajectories.Labeled.Data;
    
    % Reassign Labels to Data Structure
    for i=1:size(Labels,2) 
        Data.(filename).(char(Labels(i)))(:,:) = DataArray(i,1:3,:);
        Data.(filename).(char(Labels(i))) = Data.(filename).(char(Labels(i)))';
    end
    
    % Get analog data and reassign to Data FP fields.
    if isfield(temp.(filename),'Force')
        for i=1:size(temp.(filename).Force,2)
            plate = ['FP',num2str(i)];
            Data.(filename).(plate).Force = temp.(filename).Force(1, i).Force';
            Data.(filename).(plate).Moment = temp.(filename).Force(1, i).Moment';
            Data.(filename).(plate).CoP = temp.(filename).Force(1, i).COP';
            
        end
    end
    
    % Example line for EMG 
    % Data.(filename).EMG1 = temp.(filename).Analog.Data(13,:)';
    
    % This is where you will want to put most of your code
    
end % End [FileLoop]

%clear temp Labels DataArray


