% Project: BackGroundSubtraction
% File Name : cleaningBlobs.m
% Name : Ilay Serr
% Email : ilay92@gmail.com
%
% cleaning blobs (square small group of pixels)

function [ mask ] = cleaningBlobs(mask)
    
    % making the work matrix in size 3 on 3 
    workMatrix = ones(3,3);
    
    % using the imerode and imdilate functions to clean the blobs
    mask = imerode(mask, workMatrix);
    mask = imdilate(mask, workMatrix);
    
end