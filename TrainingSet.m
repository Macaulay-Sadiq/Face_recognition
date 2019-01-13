function [D , L] = TrainingSet(TrainPath)
% The TrainingSet function will create a Matrix to store the Training Images.
%
%   Input
%       Path - Path to the directory containing Images
%
%   Output
%       D    - Matrix containing each Training Image as 1D vector
%       L    - Matrix with the label of each Image in the Training set

%% Function starts here

Image_dir = [dir(fullfile(TrainPath,'*jpg')); dir(fullfile(TrainPath,'*JPG')); dir(fullfile(TrainPath,'*jpeg'))];

D = []; % Data Matrix
L = []; % Label Matrix

for Idx = 1:length(Image_dir)
    
    % Read the Images from directory
    Img_name = Image_dir(Idx).name;
    filename = strcat(TrainPath,Img_name);
    Image = imread(filename);
    [r, c] = size(Image);
    
    temp = reshape(Image',1,r*c);   % Reshaping 2D Images into 1D Image Vectors
    D = [D; temp];
    L = [L; Img_name(1:5)];
    
end
