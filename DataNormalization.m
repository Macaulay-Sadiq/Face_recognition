close all;
clear all;
clc ;
%%
% step (a) starting

Input_images = {};
Input_features = {};
Normalized_images = {};

original = dir('*.jpg');
original_f = dir('*.txt');

filename_f = [original_f(1).name];
Features=[13 20 ; 50 20 ; 34 34 ; 16 50 ; 48 50];

F_bar = textread(filename_f);
[AB, A, b] = FindTransformation( F_bar, Features);


% step (b)
F_bar_prime = [F_bar ones(5,1)]  * AB;
% step (c)
% setting Fbar <-- Fbar_prime
F_bar_2 = F_bar_prime ; 
F_sum =0;
flag = true;
while flag
   F_bar =  F_bar_2;
for k = 1:length(original_f)
    filename_f = [original_f(k).name];
    Input = textread(filename_f);

    [AB(:,:,k), A(:,:,k), b(:,k)] = FindTransformation( Input, F_bar);
    F_prime = [F_bar ones(5,1)] * AB(:,:,k);

    F_sum = F_sum + F_prime;
     
end
F_bar_2 = F_sum/length(original_f);
error = max(max(abs(F_bar_2 - F_bar)))
    if  error < 48 % to check error
        flag = false;
    end
end
for k = 1:length(original)
    filename = [original(k).name];
    I = imread(filename);
    I = rgb2gray(I);
   Normalized_Im = ApplyTransformation( A(:,:,k), b(:,k), I);
    
    filename = ['.\Normalized\' original(k).name];
    Normalized_images{k} = Normalized_Im';
    imwrite(Normalized_Im',filename);
end