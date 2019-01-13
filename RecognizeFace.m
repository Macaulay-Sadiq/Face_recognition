function [Match1, Match2, Match3, Accuracy1,Accuracy2,Accuracy3] = RecognizeFace(Test_Image, Img_Name, PCA_Transform_Matrix, D, L, TestPath)
%% The function RecognizeFace is created to recognize the Correct Matches for the give Test Image.
%   Input:
%
%       P    - PCA Projection Matrix
%       D    - Matrix containing each Training Image as 1D vector
%       L    - Matrix with the label of each Image in the Training set
%
%   Output
%       Match 1, 2, 3    - All three Matches
%       Accuracy 1, 2, 3 - Recognition Accuracy

%% Function starts here

%% Perform PCA on Train and Test Images

% Compute Feature Vectors of all Train Images
Feature_Vector_Train = double(D) * PCA_Transform_Matrix; % pxN_pca Matrix

% Reshape 2D Test_Image into 1D Image Vector
[row, col] = size(Test_Image);
Img = reshape(Test_Image',1,row*col);
D_Img = double(Img);

% Compute Feature Vector for the Test Image
Feature_Vector_Test = D_Img * PCA_Transform_Matrix;  % 1xN_pca Matrix

%% Calculate Euclidian_Distance between Test Vector and all Train Vectors
Euclidian_Dist = [];
[r,~] = size(Feature_Vector_Train);

for i = 1 : r
    temp = Feature_Vector_Train(i,:);
    Diff = (norm(Feature_Vector_Test - temp))^2;
    Euclidian_Dist = [Euclidian_Dist Diff];
end

% Sort the Euclidean distances in Ascending order
[~,Idx] = sort(Euclidian_Dist);

%% Find Best Matches and Construct Eigen Faces
Error1 = 0;
Len = size(D,1);

for i = 1:Len
    if strcmp(L(Idx(i),:),Img_Name(1:5))  % If Label Matches
        
        Match1 = reshape(D(Idx(i),:),64,64)'; %output the recognised image
        break;
    else
        Error1 = Error1 + 1; % If not Recognised increase Error
    end
end

Error2 = Error1;

for j = i+1:Len
    if strcmp(L(Idx(j),:),Img_Name(1:5))  % If Label Matches
        
        Match2 = reshape(D(Idx(j),:),64,64)'; %output the recognised image
        break;
    else
        Error2 =Error2 + 1;
    end
end

Error3 = Error2;

for k = j+1:Len
    if strcmp(L(Idx(k),:),Img_Name(1:5))  % If Label Matches
        
        Match3 = reshape(D(Idx(k),:),64,64)'; %output the recognised image
        break;
    else
        Error3 =Error3 + 1;
    end
end

%% Calcualte Accuracy

TestImages = length(TestPath);
Acc1 =  abs(1-Error1/TestImages)*100;
Accuracy1 = round(Acc1,2);

Acc2 = abs(1-Error2/TestImages)*100;
Accuracy2 = round(Acc2,2);

Acc3 = abs(1-Error3/TestImages)*100;
Accuracy3 = round(Acc3,2);

end

