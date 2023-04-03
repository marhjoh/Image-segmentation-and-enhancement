%% Threshhold Segmentation
% Thresholding is a simple image segmentation method that separates pixels into two classes based on their intensity values. 
% All pixels with intensity values above a certain threshold value are considered part of one class, while all pixels with 
% intensity values below the threshold are considered part of the other class.

function binary_img = my_thresholding(img, threshold)

% Convert the image to grayscale
img_gray = rgb2gray(img);

% Perform thresholding
binary_img = img_gray > threshold;
end
