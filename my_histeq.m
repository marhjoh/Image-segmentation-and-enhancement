%% Histogram Equalization
% Histogram equalization is a technique used to improve the contrast of an 
% image by redistributing the pixel values in the image histogram. In other 
% words, it spreads out the intensity values in the image to cover the 
% entire intensity range, which results in a more evenly distributed histogram. 

function [img_new, cdfnorm] = my_histeq(img)
    
    % calculate cumulative distribution function of original image
    h = imhist(img);
    cdf = zeros(1,256);
    for i=1:256
        cdf(i) = sum(h(1:i));
    end

    cdfnorm = round( ((cdf - min(cdf))/(size(img, 1)*size(img, 2) - min(cdf)))*255 );
    
    % apply the mapping to image
    img_new = img;
    for i=1:size(img,1)
        for j=1:size(img,2)
            img_new(i,j) = cdfnorm(img(i,j)+1);
        end
    end
    
    % calculate cumulative distribution function of ehanced image
    h_new = imhist(img_new);
    cdf_new = zeros(1,256);
    for i=1:256
        cdf_new(i) = sum(h_new(1:i));
    end
end


