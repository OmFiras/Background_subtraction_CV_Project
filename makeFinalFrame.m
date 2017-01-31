
% Project: BackGroundSubtraction
% File Name : makeFinalFrame.m
% Name : Ilay Serr
% Email : ilay92@gmail.com
%
% A function to make the final frame (multipling the mask and the current
% frame)

function [finalFrame] = makeFinalFrame(mask, currFrame)

    % making the result frame by multipling the mask and the current
    % working frame
    finalFrame(:,:,1) = mask .* currFrame(:,:,1);
    finalFrame(:,:,2) = mask .* currFrame(:,:,2);
    finalFrame(:,:,3) = mask .* currFrame(:,:,3);
    
end

