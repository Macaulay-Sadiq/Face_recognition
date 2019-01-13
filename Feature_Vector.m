function [PCA_Transf_Matrix] = Feature_Vector( D, PCA_Number)

% A function to find featurevectors of train images using PCA

% Input parameters
%         trainpath                   Data matrix of train images
%                                       (output given by createTrainDataBase function)
%           n_pca                       number of principal components for PCA
%
%
% Output
%         pca_transf_mat              pca transformation matrix whose
%                                       columns are eigen vectors of D'D/(p-1)
%
%
% Description:
% This function takes the data matrix and number of principal componenets
% to compute dimension reduction and computes the covriance matrix and
% eigen vectors of covraince matrix.
%  finally we get PCA transformation matrix[m



[M,~] = size(D);

D_Mean = mean(D); % mean of all images (1 x 4096)

Mean_matrix = repmat(D_Mean,M,1);  % to calculate Mean matrix

% Computing the covariance matrix by removing the Mean. 
D_bar = double(D) - Mean_matrix; % remove mean
Sigma_prime = (D_bar * D_bar')./(M-1); % covrainace matrix
[Phi_prime, Diago ] = eig(Sigma_prime); % To claculate eigenvectors and Eigenvalues

% Here we actually need to calculate eigen vectors of D'D which gives d x d matrix
% which is 4096 x 4096. So instead we calculate eigen vectors of DD'
% which is p x p matrix which is 93 x 93.
% we require eigen vectors of D'D
% let X be eigen vector of DD' then (DD')X = eX
%                                multiply with D'
%                                (D'D)D'X = e (D'X)
%
%                                so here eigen vector of D'D is D'X


Diago = diag(Diago);
[c, idx] = sort(Diago,1,'descend');

% Let put Eigenvectors in decreasing order of Eigenvalues
Phi1 = [];
for i = 1:M
    Phi1 = [Phi1 Phi_prime(:,idx(i))];
end

% From above we can calculate the pca transformation matrix as
PCA_Transf_Matrix = D_bar' * Phi1;

% f we need to take required number of principal components
PCA_Transf_Matrix = PCA_Transf_Matrix(:,1 : PCA_Number );

end

