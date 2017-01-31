
% Project: BackGroundSubtraction
% File Name : backgroundSubtraction.m
% Name : Ilay Serr
% Email : ilay92@gmail.com
%
% the main function to calculate the background subtraction

function [ outputVid ] = backgroundSubtraction(video_path, k, th,type ,color, random)
    
    % taking care of the case the user want the result in colors.
    if (strcmp('rgb',color) == 1)
        
        % reading the video given by using the videoReader function.
        vid = read(VideoReader(video_path));
        infoVid = size(vid);
        
        % mkaing sure the number of frames entered is legal.
        if (k > infoVid(4)) k = infoVid(4);
        elseif (k <= 0) k = 1;
        end     
        
        % splitting the video in to 3 single color videos.
        red = vid(:,:,1,:);
        green = vid(:,:,2,:);
        blue = vid(:,:,3,:); 
        
        
        % making the background image by the median k frames using
        % the median function.
        if(strcmp('median',type)==1)
            
            % making the background image using k random frames.
            if(strcmp('random',random)==1)
                [bcg_r,bcg_g,bcg_b] = genRandomFrames(infoVid(4),k,red,green,blue,type);
                
            % in case the user dont want random frames.
            else 
                bcg_r = median(red(:,:,:,1:k), 4);
                bcg_g = median(green(:,:,:,1:k), 4);
                bcg_b = median(blue(:,:,:,1:k), 4);
            end
            
        % making the background image by the mean k frames using
        % the mean function.
        elseif(strcmp('mean',type)==1)
            
            % making the background image using k random frames.
            if(strcmp('random',random)==1)
                [bcg_r,bcg_g,bcg_b] = genRandomFrames(infoVid(4),k,red,green,blue,type);
                
            % in case the user dont want random frames.
            else 
                bcg_r = mean(red(:,:,:,1:k), 4);
                bcg_g = mean(green(:,:,:,1:k), 4);
                bcg_b = mean(blue(:,:,:,1:k), 4);
            end
            
        % making the background image a single frame. (by default-frame #1)
        elseif(strcmp('single',type)==1)
            
            % making the background image using a random frame.
            if(strcmp('random',random)==1)
                [bcg_r,bcg_g,bcg_b] = genRandomFrames(infoVid(4),1,red,green,blue,type);
                
            % in case the user dont want a random frame.
            else 
                bcg_r = (red(:,:,:,1));
                bcg_g = (green(:,:,:,1));
                bcg_b = (blue(:,:,:,1));
            end
        end
        
        % going over all the frames in a single loop
        for f = 1 : infoVid(4)

            % making the mask using the makeMask function.
            mask = makeMask(bcg_r, bcg_g, bcg_b, th, vid(:,:,:,f));
            
            % cleaning blobs by using the cleaningBlobs function.
            mask = uint8(cleaningBlobs(mask));

            % making the result frame by using the makeFinalFrame function.
            outputVid(:,:,:,f) = makeFinalFrame(mask,vid(:,:,:,f));
            
        end
        
        % playing the original video and the result video side by side.
        c = [vid , outputVid];
        implay(c);
        
    % taking care of the case the user want the result in grayscale.   
    elseif (strcmp('gray',color) == 1)
        
        % reading the video given by using the makeVidGray function.
        grayVid = makeVidGray(video_path);
        infoVid = size(grayVid);
        
        % mkaing sure the number of frames entered is legal.
        if (k > infoVid(3)) k = infoVid(3);
        elseif (k <= 0) k = 1;
        end    
        
        % making the background image by the median k frames using
        % the median function.
        if(strcmp('median',type) == 1)
            
            % making the background image using k random frames.
            if(strcmp('random',random)==1)
                l = randperm(infoVid(3), k);
                for p = 1 : k
                    medBcgRed(:,:,p) = grayVid(:,:,l(p));
                end
                bcg = median(medBcgRed(:,:,:), 3);
            
            % in case the user dont want random frames.    
            else
                bcg = median(grayVid(:,:,1:k), 3);
            end
            
        % making the background image by the mean k frames using
        % the median function.
        elseif(strcmp('mean',type) == 1)
            
            % making the background image using k random frames.
            if(strcmp('random',random)==1)
                l = randperm(infoVid(3), k);
                for p = 1 : k
                    medBcgRed(:,:,p) = grayVid(:,:,l(p));
                end
                bcg = mean(medBcgRed(:,:,:), 3);
            
            % in case the user dont want random frames.     
            else
                bcg = mean(grayVid(:,:,1:k), 3);
            end
            
        % making the background image a single frame. (by default-frame #1)  
        elseif(strcmp('single',type) == 1)
            
            % making the background image using a random frame.
            if(strcmp('random',random)==1)
                l = randperm(infoVid(3));
                bcg = grayVid(:,:,l(1));
                
            % in case the user dont want a random frame. 
            else
                bcg = grayVid(:,:,1);
            end
        end
        
        % going over all the frames in a single loop.
        for f = 1 : infoVid(3)
            
            % making the mask using the given threshold
            mask = abs(double(grayVid(:,:,f)) - double(bcg)) - th;
            mask(mask <= 0) = 0;
            mask(mask > 0) = 1;
            
            % cleaning the blobs using the cleaningBlobs function.
            mask = uint8(cleaningBlobs(mask));
            
            % making the result frame and putting it in the output video
            outputVid(:,:,f) = mask .* grayVid(:,:,f);
        end
        
        % playing the original video in grayscale
        % and the result video side by side.
        c = [grayVid , outputVid];
        implay(c)
    end
        
end
