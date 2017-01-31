% Project: BackGroundSubtraction
% File Name : makeMask.m
% Name : Ilay Serr
% Email : ilay92@gmail.com
%
% A function that makes the suitable mask

function [mask] = makeMask(bcg_r, bcg_g, bcg_b, th, currFrame)

    % reducing the current working frame with the back ground frame in
    % absolut value and reducing the threshold, (per color).
    redMask = abs(double(currFrame(:,:,1)) - double(bcg_r)) - th;
    greenMask = abs(double(currFrame(:,:,2)) - double(bcg_g)) - th;
    blueMask = abs(double(currFrame(:,:,3)) - double(bcg_b)) - th;
    
    % dividing the pixels into groups of '1' and '0' depend if ther'e
    % bigger or smaller then the threshold given, (per color).
    redMask(redMask <= 0) = 0;
    redMask(redMask > 0) = 1;
    greenMask(greenMask <= 0) = 0;
    greenMask(greenMask > 0) = 1;
    blueMask(blueMask <= 0) = 0;
    blueMask(blueMask > 0) = 1;
    
    % unite all the masks to a single mask.
    mask = uint8(redMask | greenMask | blueMask);
    
end

