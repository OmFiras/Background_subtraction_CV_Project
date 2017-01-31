% Project: BackGroundSubtraction
% File Name : makeVidGray.m
% Name : Ilay Serr
% Email : ilay92@gmail.com
%
% A function that makes the video gray

function output_vid = makeVidGray(video_path)
   
    % reading the video given by using the videoReader function.
    vid = read(VideoReader(video_path));
    infoVid = size(vid);
    
    % making sure the video is colorful and convert it to grayscale.
    if (infoVid(3) == 3)
        for k = 1 : infoVid(4);
            output_vid(:,:,k) = rgb2gray(vid(:,:,:,k));
        end
        
    % in case the video is grayscale already.
    else 
       output_vid = vid;
    end
end

