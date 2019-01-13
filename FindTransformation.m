function [AB,A,b] = FindTransformation(F_bar, Fp)

% FindTransformation function that finds best transformation given by (A, b),
% that maps the feature in F_bar to those in Fp.
% From the the equation  Fp = A*F_bar + b .
%   The Input are :
%       F_bar    - Feature of an Image having (x,y) coordinates
%       Fp  which has two coordibates.  (Fpx, Fpy) -> Predetermined Sample Feature
%       in x and y coordinates.             
%
%   Output:
%       A(Ax, Ay) and b --> are Parameters of Affine Transformation

F_px = Fp(:,1);
F_py = Fp(:,2);

F_1 = [F_bar ones(5,1)];

% To Calculate Parameters of Affine Transform given by (A,b)
Ax = pinv(F_1)* F_px;  
Ay = pinv(F_1)* F_py;
AB = pinv(F_1) * Fp;
% Finding A and b as : 
A = [Ax(1:2,:) Ay(1:2,:)] ;
b = [Ax(3,:) Ay(3,:)]' ;

end

