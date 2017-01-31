
% Project: BackGroundSubtraction
% File Name : genRandomFrames.m
% Name : Ilay Serr
% Email : ilay92@gmail.com
%
% A function to get k random frames in median / mean method

function [bcg_r, bcg_g, bcg_b] = genRandomFrames(numFrames,k ,red ,green ,blue ,type)

    % saving into a vector k random numbers in the bounderies of the video. 
    vec = randperm(numFrames, k);
    
    % making a new video with the k random frames.
    for p = 1 : k
        medBcgRed(:,:,:,p) = red(:,:,:,vec(p));
        medBcgGreen(:,:,:,p) = green(:,:,:,vec(p));
        medBcgBlue(:,:,:,p) = blue(:,:,:,vec(p));
    end
    
    % making the background images in 3 colors by the median k frames 
    % using the median function. 
    if(strcmp('median',type)==1)
        bcg_r = median(medBcgRed(:,:,:,:), 4);
        bcg_g = median(medBcgGreen(:,:,:,:), 4);
        bcg_b = median(medBcgBlue(:,:,:,:), 4);
        
    % making the background images in 3 colors by the mean k frames 
    % using the mean function.
    elseif (strcmp('mean',type)==1)
        bcg_r = mean(medBcgRed(:,:,:,:), 4);
        bcg_g = mean(medBcgGreen(:,:,:,:), 4);
        bcg_b = mean(medBcgBlue(:,:,:,:), 4);
        
    % returning the background images by choosing a random frame in the vid
    else 
         bcg_r = (red(:,:,:,vec(1)));
         bcg_g = (green(:,:,:,vec(1)));
         bcg_b = (blue(:,:,:,vec(1)));
    end   
    
end