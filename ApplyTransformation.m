function [Normalized_Im] = ApplyTransformation(A, b, Ii)

% ApplyTransformation function that apply (A, b) to the image Ii,
% to get a reduced size 64 x 64 pixels.
%   The Input are :
%       Ii   --> input image. The input Image size is Ii(Iy,Ix) = (320, 240)
%       A (Ax, ay)and b --> Parameters of Affine Transformation
       
%   Output: Normalized_Im which is a normalized image of 64x64 image.
%% Function starts here :

% creating an empty 64x64 image
Normalized_Im = uint8(zeros(64, 64)); 

for i=1:64
    for j=1:64
        % apply the inverse transformation for all pixel
        normalize_point   = ( pinv(A ) * ( [ i; j ] - b ) );
        % Finding the corresponding image
        I_x = int32(normalize_point(1,:));
        I_y = int32(normalize_point(2,:));
        
        if ( I_x <= 0 )
            I_x = 1;
        end
        
        if( I_y <= 0 )
            I_y = 1;
            
        end
        
        if ( I_x > 240 )
            I_x = 240;
        end
        
        if ( I_y > 320 )
            I_y = 320;
        end
        %Saving the Normalized 64x64 image for computing the PCA 
        Normalized_Im(i,j) = uint8( Ii(I_y, I_x ) );
    end
end

end

