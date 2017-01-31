% Project: BackGroundSubtraction
% File Name : readVid.m
% Name : Ilay Serr
% Email : ilay92@gmail.com
%
% A function to read a video given
function videoFrames = readVid(videoFilename)
    
    % the given readVid function.
    v = VideoReader(videoFilename);
    videoFrames = readFRAME(v);

end